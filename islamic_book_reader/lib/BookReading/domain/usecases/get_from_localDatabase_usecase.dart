import 'package:dartz/dartz.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/arabic_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/books_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/combined_entities.dart';
import 'package:islamic_book_reader/BookReading/domain/repository/bookReading_repository.dart';
import 'package:islamic_book_reader/essentials/failure.dart';

class GetFromLocalDatabaseUsecase{

  const GetFromLocalDatabaseUsecase({
    required this.bookReadingRepository,
  });

  final BookReadingRepository bookReadingRepository;


  Future<Either<LocalDatabaseFailure, CombinedEntityBook>> getReadingMaterialFromLocalDatabase({required BooksEntity book}) async {
    try {
      // Step 1: Retrieve headings for the book
      final headingsResult = await bookReadingRepository.getHeadingFromLocalDatabase(BookId: book.id);

      return await headingsResult.fold(
        (failure) => Left(failure),
        (headings) async {
          // Step 2: Retrieve contents and Arabic entities for each heading
          final combinedHeadings = <CombinedEntityHeading>[];
          
          for (final heading in headings) {
            final contentsResult = await bookReadingRepository.getContentFromLocalDatabase(HeadingId: heading.id);
            
            final List<CombinedEntityContent> combinedContents = await contentsResult.fold(
              (failure) => <CombinedEntityContent>[],
              (contents) async {
                final combinedContentList = <CombinedEntityContent>[];
                
                for (final content in contents) {
                  final arabicResult = await bookReadingRepository.getArabicFromLocalDatabse(ContentId: content.id);
                  
                  final arabicEntities = arabicResult.fold(
                    (failure) => <ArabicEntity>[],
                    (arabics) => arabics,
                  );
                  
                  combinedContentList.add(CombinedEntityContent(content: content, arabic: arabicEntities));
                }
                
                return combinedContentList;
              },
            );

            combinedHeadings.add(CombinedEntityHeading(heading: heading, combinedEntityContent: combinedContents));
          }

          // Step 3: Combine all data into CombinedEntityBook
          final combinedEntityBook = CombinedEntityBook(book: book, combinedEntityHeading: combinedHeadings);
          return Right(combinedEntityBook);
        },
      );
    } catch (e) {
      print("Error in getting reading material from database: $e");
      return Left(LocalDatabaseFailure());
    }
  }

}