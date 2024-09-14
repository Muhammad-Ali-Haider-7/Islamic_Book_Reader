import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:islamic_book_reader/BookReading/data/datasources/local_bookReading_datasource.dart';
import 'package:islamic_book_reader/BookReading/data/datasources/remote_bookReading_datasource.dart';
import 'package:islamic_book_reader/BookReading/data/repository_impl/bookReading_repository_impl.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/add_to_localDatabase_usecase.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_from_firebase_usecase.dart';
import 'package:islamic_book_reader/GetBooks/presentation/bloc/downloadBook_bloc.dart';
import 'package:islamic_book_reader/GetBooks/presentation/views/addMoreView.dart';
import 'package:islamic_book_reader/essentials/databaseHelper.dart';

class AddMore extends StatelessWidget {
  const AddMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: 
    [
       RepositoryProvider<LocalBookReadingDatasource>(create: (context)=> LocalBookReadingDatasource(instance: GetIt.instance<DatabaseHelper>())),
      RepositoryProvider<RemoteBookReadingDatasource>(create: (context) => RemoteBookReadingDatasource(firestore: GetIt.instance<FirebaseFirestore>())),
      RepositoryProvider<BookReadingRepositoryImpl>(create: (context)=> BookReadingRepositoryImpl(localDatabaseResource: RepositoryProvider.of<LocalBookReadingDatasource>(context), remoteDatabaseResource:  RepositoryProvider.of<RemoteBookReadingDatasource>(context))),
      RepositoryProvider<AddToLocaldatabaseUsecase>(create: (context)=> AddToLocaldatabaseUsecase(bookReadingRepository: RepositoryProvider.of<BookReadingRepositoryImpl>(context)),),
      RepositoryProvider<GetFromFirebaseUsecase>(create: (context)=> GetFromFirebaseUsecase(repository: RepositoryProvider.of<BookReadingRepositoryImpl>(context)),)
    ], child: BlocProvider(
      create: (context)=>
      DownloadbookBloc(
        addToLocaldatabaseUsecase: RepositoryProvider.of<AddToLocaldatabaseUsecase>(context), 
        getFromFirebaseUsecase: RepositoryProvider.of<GetFromFirebaseUsecase>(context)
        )..add(const DownloadViewFromRemoteResourceEvent()),
        child: AddMoreView(),
        )
      );
    
  }
}