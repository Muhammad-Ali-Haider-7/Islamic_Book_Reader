import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:islamic_book_reader/BookReading/data/datasources/local_bookReading_datasource.dart';
import 'package:islamic_book_reader/BookReading/data/datasources/remote_bookReading_datasource.dart';
import 'package:islamic_book_reader/BookReading/data/repository_impl/bookReading_repository_impl.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/books_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_Book_list_from_localDatabase_usecase.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_from_firebase_usecase.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_from_localDatabase_usecase.dart';
import 'package:islamic_book_reader/BookReading/presentation/bloc/bloc_BookReading.dart';
import 'package:islamic_book_reader/BookReading/presentation/views/readingView.dart';
import 'package:islamic_book_reader/essentials/databaseHelper.dart';


class ReadingPage extends StatefulWidget{
  const ReadingPage({super.key, required this.Bookid , required this.BookName});

  final String Bookid;
  final String BookName;

  
  
  @override
  State<ReadingPage> createState() => _readingPageState();
  
}

class _readingPageState extends State<ReadingPage>{

  @override
  Widget build(BuildContext context) {
    final BooksEntity Book = BooksEntity(name: widget.BookName, id: widget.Bookid);
    
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<LocalBookReadingDatasource>(create: (context)=> LocalBookReadingDatasource(instance: GetIt.instance<DatabaseHelper>())),
      RepositoryProvider<RemoteBookReadingDatasource>(create: (context) => RemoteBookReadingDatasource(firestore: GetIt.instance<FirebaseFirestore>())),
      RepositoryProvider<BookReadingRepositoryImpl>(create: (context)=> BookReadingRepositoryImpl(localDatabaseResource: RepositoryProvider.of<LocalBookReadingDatasource>(context), remoteDatabaseResource:  RepositoryProvider.of<RemoteBookReadingDatasource>(context))),
      RepositoryProvider(create: (context)=> GetBookListFromLocalDatabaseUsecase(bookReadingRepository: RepositoryProvider.of<BookReadingRepositoryImpl>(context))),
      RepositoryProvider(create: (context)=> GetFromFirebaseUsecase(repository: RepositoryProvider.of<BookReadingRepositoryImpl>(context))),
      RepositoryProvider(create: (context)=> GetFromLocalDatabaseUsecase(bookReadingRepository: RepositoryProvider.of<BookReadingRepositoryImpl>(context))),
    
    ],
    child: BlocProvider(
      create: (context)=> ReadingBloc(
        getBookListFromLocalDatabaseUsecase: RepositoryProvider.of<GetBookListFromLocalDatabaseUsecase>(context),
        getFromFirebaseUsecase: RepositoryProvider.of<GetFromFirebaseUsecase>(context),
        getFromLocalDatabaseUsecase:RepositoryProvider.of<GetFromLocalDatabaseUsecase>(context)
        )..add(ReadFromLocalResourceEvent(bookId: Book)),
      child: const ReadingView()));
  }
}