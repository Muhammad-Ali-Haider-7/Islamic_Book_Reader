import 'package:islamic_book_reader/BookReading/data/model/books/books_model.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/arabic_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/books_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/content_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/heading_entity.dart';
import 'package:islamic_book_reader/essentials/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BookReadingRepository {


Future<Either<RemoteDatabaseFailure,List<BooksEntity>>> getBooksFromFirestore();

Future<Either<RemoteDatabaseFailure,void>> addBookFromFireStore({required String bookName, required String bookId});

Future<Either<LocalDatabaseFailure,List<BooksEntity>>> getBooksFromLocalDatabase();

Future<Either<LocalDatabaseFailure,List<HeadingEntity>>> getHeadingFromLocalDatabase({required String BookId});

Future<Either<LocalDatabaseFailure, List<ContentEntity>>> getContentFromLocalDatabase({required String HeadingId});

Future<Either<LocalDatabaseFailure,List<ArabicEntity>>> getArabicFromLocalDatabse({required String ContentId});



}