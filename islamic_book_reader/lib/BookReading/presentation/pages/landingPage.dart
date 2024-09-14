import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:islamic_book_reader/BookReading/data/datasources/local_bookReading_datasource.dart';
import 'package:islamic_book_reader/BookReading/data/datasources/remote_bookReading_datasource.dart';
import 'package:islamic_book_reader/BookReading/data/repository_impl/bookReading_repository_impl.dart';
import 'package:islamic_book_reader/BookReading/domain/repository/bookReading_repository.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_Book_list_from_localDatabase_usecase.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_from_firebase_usecase.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_from_localDatabase_usecase.dart';
import 'package:islamic_book_reader/BookReading/presentation/bloc/bloc_BookReading.dart';
import 'package:islamic_book_reader/BookReading/presentation/views/landingView.dart';
import 'package:islamic_book_reader/BookReading/presentation/views/viewScroll.dart';
import 'package:islamic_book_reader/Configrations/data/datasource/local_datasource.dart';
import 'package:islamic_book_reader/Configrations/data/repository_impl/config_repository_impl.dart';
import 'package:islamic_book_reader/Configrations/domain/usecases/fontSizeUsecase.dart';
import 'package:islamic_book_reader/Configrations/presentation/bloc/settings_bloc.dart';
import 'package:islamic_book_reader/essentials/databaseHelper.dart';
import 'package:islamic_book_reader/essentials/fontSizeManager/fontSizeManager.dart';
import 'package:lottie/lottie.dart';


class LandingPage extends StatefulWidget{
 
  @override
  State<LandingPage> createState() => _landingPageState();
  
}

class _landingPageState extends State<LandingPage>{
  List<String> BookData = ["Hello1","Hello2","Hello3","Hello4"];
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers:[
      RepositoryProvider<LocalBookReadingDatasource>(create: (context)=> LocalBookReadingDatasource(instance: GetIt.instance<DatabaseHelper>())),
      RepositoryProvider<RemoteBookReadingDatasource>(create: (context) => RemoteBookReadingDatasource(firestore: GetIt.instance<FirebaseFirestore>())),
      RepositoryProvider<BookReadingRepositoryImpl>(create: (context)=> BookReadingRepositoryImpl(localDatabaseResource: RepositoryProvider.of<LocalBookReadingDatasource>(context), remoteDatabaseResource:  RepositoryProvider.of<RemoteBookReadingDatasource>(context))),
      RepositoryProvider(create: (context)=> GetBookListFromLocalDatabaseUsecase(bookReadingRepository: RepositoryProvider.of<BookReadingRepositoryImpl>(context))),
      RepositoryProvider(create: (context)=> GetFromFirebaseUsecase(repository: RepositoryProvider.of<BookReadingRepositoryImpl>(context))),
      RepositoryProvider(create: (context)=> GetFromLocalDatabaseUsecase(bookReadingRepository: RepositoryProvider.of<BookReadingRepositoryImpl>(context))),
      //settings
      RepositoryProvider(create: (context)=> LocalDatasource(instance: GetIt.instance<DatabaseHelper>())),
      RepositoryProvider(create: (context)=>ConfigRepositoryImpl(RepositoryProvider.of<LocalDatasource>(context))),
      RepositoryProvider(create: (context) => FontSizeUsecase(configRepository: RepositoryProvider.of<ConfigRepositoryImpl>(context))),
    ], 
    child: MultiBlocProvider(
      providers: 
      [
        BlocProvider(
        create: (context) => 
        ReadingBloc(
          getBookListFromLocalDatabaseUsecase: RepositoryProvider.of<GetBookListFromLocalDatabaseUsecase>(context),
          getFromFirebaseUsecase: RepositoryProvider.of<GetFromFirebaseUsecase>(context),
          getFromLocalDatabaseUsecase:RepositoryProvider.of<GetFromLocalDatabaseUsecase>(context)
          ),),

        BlocProvider(create: (context) => SettingsBloc(fontSizeUsecase: RepositoryProvider.of<FontSizeUsecase>(context))..add(GetFontSizeEvent()))
      ],
      child: 
      BlocListener<SettingsBloc,SettingsStates>(
        listener: (context, state){
          if(state is SettingsSuccessGet){
            print("Success getting font size from local database ${state.fontSizeEntity}");
            FontSizeManager.setArabic(value: state.fontSizeEntity.arabic);
            FontSizeManager.setContent(value: state.fontSizeEntity.content);
            FontSizeManager.setHeading(value: state.fontSizeEntity.heading);
          }
        },
        child: LandingView()),
    )
        );
  }
  
}