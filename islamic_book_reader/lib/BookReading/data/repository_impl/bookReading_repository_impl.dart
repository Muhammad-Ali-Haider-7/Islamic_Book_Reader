import 'package:dartz/dartz.dart';
import 'package:islamic_book_reader/BookReading/data/datasources/local_bookReading_datasource.dart';
import 'package:islamic_book_reader/BookReading/data/datasources/remote_bookReading_datasource.dart';
import 'package:islamic_book_reader/BookReading/data/model/arabic/arabic_model.dart';
import 'package:islamic_book_reader/BookReading/data/model/books/books_model.dart';
import 'package:islamic_book_reader/BookReading/data/model/content/content_model.dart';
import 'package:islamic_book_reader/BookReading/data/model/heading/heading_model.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/arabic_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/books_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/content_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/heading_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/repository/bookReading_repository.dart';
import 'package:islamic_book_reader/essentials/failure.dart';

class BookReadingRepositoryImpl implements BookReadingRepository{

  const BookReadingRepositoryImpl({
    required this.localDatabaseResource,
    required this.remoteDatabaseResource,
  });

  final LocalBookReadingDatasource localDatabaseResource;
  final RemoteBookReadingDatasource remoteDatabaseResource;

  @override
  Future<Either<RemoteDatabaseFailure, void>> addBookFromFireStore({required String bookName, required String bookId}) async {
    try{
        // gettings heading from Firebase
        await localDatabaseResource.addBook(book: BookModel(id: bookId, name: bookName));

        final headings = await remoteDatabaseResource.getHeadingFromFirestore(BookId: bookId);
        List<HeadingModel> headingsList = List.generate(headings.length, (i){
          return HeadingModel.fromJson(headings[i]);
        });
        await localDatabaseResource.addHeadings(headings: headingsList);
        
        // getting content from Firebase based on heading 
        for(HeadingModel heading in headingsList ){
          // print("-"*20 + "for adding content for heading with id ${heading.id}" + "-"*20);
          final contents = await remoteDatabaseResource.getContentFromFirestore(BookId: bookId, HeadingId: heading.id);
          List<ContentModel> contentList = List.generate(contents.length, (i){
            return ContentModel.fromJson(contents[i]);
          });
          
          await localDatabaseResource.addContents(Contents: contentList);
          
          // getting arabic from Fierbase based on Content
          for(ContentModel content in contentList){
            // print("-"*20 + "for adding arabic for content with id ${content.id}" + "-"*20);
            final arabics = await remoteDatabaseResource.getArabicFromFirestore(BookId: bookId, HeadingId: heading.id, ContentId: content.id);
            List<ArabicModel> arabicList = List.generate(arabics.length, (i){
              return ArabicModel.fromJson(arabics[i]);
            });
            await localDatabaseResource.addArabics(Arabics: arabicList);
          }
        }

        return const Right(null);
    }
    catch(e, stacktrace){
      print("Error caught from repository $e -------------------- $stacktrace");
      return Left(RemoteDatabaseFailure());
    }
  }

  @override
  Future<Either<LocalDatabaseFailure, List<ArabicEntity>>> getArabicFromLocalDatabse({required String ContentId})async {
    try{

      final arabics = await localDatabaseResource.getArabic(contentId: ContentId);

      return Right(arabics);
    }
    catch(e){
      print("getting error from repo $e");
      return Left(LocalDatabaseFailure());
    }
  }

  @override
  Future<Either<RemoteDatabaseFailure, List<BooksEntity>>> getBooksFromFirestore() async {
      try{
          final booksList = await remoteDatabaseResource.getBooksFromFirestore();
          return Right(
            List.generate(booksList.length, (i){
              return BookModel.fromJson(booksList[i]);
            })
          );
      }
      catch(e){
        print("getting error from repo $e");
        return Left(RemoteDatabaseFailure());
      }
  }

  @override
  Future<Either<LocalDatabaseFailure, List<BooksEntity>>> getBooksFromLocalDatabase() async{
    try{

      final books = await localDatabaseResource.getBooks();

      return Right(books);
    }
    catch(e){
      print("getting error from repo $e");
      return Left(LocalDatabaseFailure());
    }
  }

  @override
  Future<Either<LocalDatabaseFailure, List<ContentEntity>>> getContentFromLocalDatabase({required String HeadingId}) async {
    try{

      final content = await localDatabaseResource.getContent(headingId: HeadingId);

      return Right(content);
    }
    catch(e){
      print("getting error from repo $e");
      return Left(LocalDatabaseFailure());
    }
  }

  @override
  Future<Either<LocalDatabaseFailure, List<HeadingEntity>>> getHeadingFromLocalDatabase({required String BookId}) async {
    try{

      final heading = await localDatabaseResource.getHeadings(BookId: BookId);

      return Right(heading);
    }
    catch(e){
      print("getting error from repo $e");
      return Left(LocalDatabaseFailure());
    }
  }
  
}