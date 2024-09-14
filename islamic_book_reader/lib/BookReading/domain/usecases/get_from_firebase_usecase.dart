import 'package:dartz/dartz.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/books_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/repository/bookReading_repository.dart';
import 'package:islamic_book_reader/essentials/failure.dart';

class GetFromFirebaseUsecase{

const GetFromFirebaseUsecase({
  required this.repository,
});

final BookReadingRepository repository;

Future<Either<RemoteDatabaseFailure, List<BooksEntity>>> getBooksFromFirestore() {
  return repository.getBooksFromFirestore();
}

}