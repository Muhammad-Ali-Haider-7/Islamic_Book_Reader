import 'package:dartz/dartz.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/books_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/repository/bookReading_repository.dart';
import 'package:islamic_book_reader/essentials/failure.dart';

class GetBookListFromLocalDatabaseUsecase{

  const GetBookListFromLocalDatabaseUsecase({
    required this.bookReadingRepository,
  });
  
  final BookReadingRepository bookReadingRepository;

  Future<Either<LocalDatabaseFailure, List<BooksEntity>>> getBooksFromLocalDatabase(){
    return  bookReadingRepository.getBooksFromLocalDatabase();
  }

}