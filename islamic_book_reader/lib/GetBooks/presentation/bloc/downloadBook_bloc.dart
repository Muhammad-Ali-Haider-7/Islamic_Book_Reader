import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/books_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/add_to_localDatabase_usecase.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_from_firebase_usecase.dart';


part "downloadBook_event.dart";
part "downloadBook_state.dart";


class DownloadbookBloc extends Bloc<DownloadbookEvent, DownloadbookState>{

DownloadbookBloc({
  required  this.addToLocaldatabaseUsecase,
  required this.getFromFirebaseUsecase,
}) : super(const DownloadbookInitial()){
  on<DownloadBookFromRemoteResourceEvent>(_onDownloadBook);
  on<DownloadViewFromRemoteResourceEvent>(_onViewList);
}

final AddToLocaldatabaseUsecase addToLocaldatabaseUsecase;
final GetFromFirebaseUsecase getFromFirebaseUsecase;


Future<void> _onViewList(
  DownloadViewFromRemoteResourceEvent event,
  Emitter emit,
) async {

  try{
    emit(const DownloadbookLoading());
    final result = await getFromFirebaseUsecase.getBooksFromFirestore();

    result.fold(
      (failure)=> emit(DownloadbookError(msg: failure.toString())),
      (success) => emit(DownloadViewBooksListBlocSuccess(book: success))
    );

  }
  catch(e){
    print("Error from downlaod bloc");
    emit(const DownloadbookError(msg: "Errror from downlaod bloc"));
  }

}

Future<void> _onDownloadBook(
  DownloadBookFromRemoteResourceEvent event,
  Emitter emit,
) async {

  try{
    emit(const DownloadbookLoading());
    final result = await addToLocaldatabaseUsecase.addBookFromFireStore(bookName: event.bookName,bookId: event.bookId);

    result.fold(
      (failure)=> emit(DownloadbookError(msg: failure.toString())),
      (success) => emit(const DownloadbookSuccess())
    );

  }
  catch(e){
    print("Error from downlaod bloc");
    emit(const DownloadbookError(msg: "Errror from downlaod bloc"));
  }
}
}