import 'package:dartz/dartz.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/books_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/repository/bookReading_repository.dart';
import 'package:islamic_book_reader/essentials/failure.dart';

class AddToLocaldatabaseUsecase {

const AddToLocaldatabaseUsecase({
  required this.bookReadingRepository
});

final BookReadingRepository bookReadingRepository;

Future<Either<RemoteDatabaseFailure,void>> addBookFromFireStore({required String bookName, required String bookId}){
    return bookReadingRepository.addBookFromFireStore(bookName: bookName, bookId: bookId);
}

}