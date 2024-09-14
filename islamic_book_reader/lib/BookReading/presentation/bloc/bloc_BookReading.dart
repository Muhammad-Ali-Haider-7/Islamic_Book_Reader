import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/books_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/combined_entities.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_Book_list_from_localDatabase_usecase.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_from_firebase_usecase.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_from_localDatabase_usecase.dart';

part "event_BlocReading.dart";

part "state_BlocReading.dart";

class ReadingBloc extends Bloc<ReadingBlocEvent,ReadingBlocState>{
  
  ReadingBloc({
    required this.getBookListFromLocalDatabaseUsecase,
    required this.getFromFirebaseUsecase,
    required this.getFromLocalDatabaseUsecase
  }):super(const ReadingBlocInitial()){
    on<ReadFromLocalResourceEvent>(_onReadFromLocalResoure);
    on<ReadBooksFromLocalResourceEvent>(_onReadBooksFromLocalResoure);
    on<FilterBooksEvent>(_onFilterBooks);
    // on<ReadFromRemoteResourceEvent>(_onReadFromFirebase);
  }

  final GetBookListFromLocalDatabaseUsecase getBookListFromLocalDatabaseUsecase;
  final GetFromFirebaseUsecase getFromFirebaseUsecase;
  final GetFromLocalDatabaseUsecase getFromLocalDatabaseUsecase;
  final List<BooksEntity> BookList = [];

  Future<void> _onReadFromLocalResoure(
    ReadFromLocalResourceEvent event,
    Emitter emit
  ) async {
    try{
    emit(const ReadingBlocLoading());

    final result = await getFromLocalDatabaseUsecase.getReadingMaterialFromLocalDatabase(book: event.bookId);

    result.fold(
      (failure)=> emit(ReadingBlocError(msg: failure.toString())),
      (book)=> emit(ReadingBlocSuccess(book: book)));

    }catch(e){
      print("Error From ReadingBloc");
      emit(const ReadingBlocError(msg: "Error From ReadingBloc"));
    }

  }

  // Future<void> _onReadFromFirebase(
  //   ReadFromRemoteResourceEvent event,
  //   Emitter emit
  // ) async {
  //   try{
  //   emit(const ReadingBlocLoading());

  //   final bookList = await getFromFirebaseUsecase.getBooksFromFirestore();

  //   bookList.fold(
  //     (failure) => emit(ReadingBlocError(msg: failure.toString())),
  //     (book) => emit(ReadingBooksListBlocSuccess(book: book)));

  //   }catch(e){
  //     print("Error From ReadingBloc");
  //     emit(const ReadingBlocError(msg: "Error From ReadingBloc"));
  //   }

  // }

  Future<void> _onFilterBooks(
    FilterBooksEvent event,
    Emitter emit
  ) async {
    try{
      emit(const ReadingBlocLoading());

      final filteredBooks = BookList.where((element) => element.name.contains(event.searchQuery)).toList();

      emit(ReadingBooksListBlocSuccess(book: filteredBooks));

    }catch(e){
      print("Error From ReadingBloc");
      emit(const ReadingBlocError(msg: "Error From ReadingBloc"));
    }

  }

  Future<void> _onReadBooksFromLocalResoure(
    ReadBooksFromLocalResourceEvent event,
    Emitter emit
  ) async {
    try{
      emit(const ReadingBlocLoading());

      // if(BookList.isNotEmpty){
      //   emit(ReadingBooksListBlocSuccess(book: BookList));
      //   return;
      // }

      final bookList = await getBookListFromLocalDatabaseUsecase.getBooksFromLocalDatabase();

      bookList.fold(
        (failure) => emit(ReadingBlocError(msg: failure.toString())),
        (book) {
          BookList.addAll(book);
          emit(ReadingBooksListBlocSuccess(book: book));}

      );

    }catch(e){
      print("Error From ReadingBloc");
      emit(const ReadingBlocError(msg: "Error From ReadingBloc"));
    }

  }

  
}