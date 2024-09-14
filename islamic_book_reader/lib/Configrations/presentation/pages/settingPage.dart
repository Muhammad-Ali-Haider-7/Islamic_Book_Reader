import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:islamic_book_reader/Configrations/data/datasource/local_datasource.dart';
import 'package:islamic_book_reader/Configrations/data/repository_impl/config_repository_impl.dart';
import 'package:islamic_book_reader/Configrations/domain/usecases/fontSizeUsecase.dart';
import 'package:islamic_book_reader/Configrations/presentation/bloc/settings_bloc.dart';
import 'package:islamic_book_reader/Configrations/presentation/views/settingView.dart';
import 'package:islamic_book_reader/Configrations/presentation/widgets/slider.dart';
import 'package:islamic_book_reader/essentials/databaseHelper.dart';
import 'package:islamic_book_reader/essentials/fontSizeManager/fontSizeManager.dart';

class SettingPage extends StatefulWidget{
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>{
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(create: (context)=> LocalDatasource(instance: GetIt.instance<DatabaseHelper>())),
      RepositoryProvider(create: (context)=>ConfigRepositoryImpl(RepositoryProvider.of<LocalDatasource>(context))),
      RepositoryProvider(create: (context) => FontSizeUsecase(configRepository: RepositoryProvider.of<ConfigRepositoryImpl>(context))),
    ], 
    child: BlocProvider(
      create: (context) => SettingsBloc(fontSizeUsecase: RepositoryProvider.of<FontSizeUsecase>(context)),
      child: SettingView()
      // child: Directionality(textDirection: TextDirection.rtl,child: SettingView(),)
      ,
      ));
  }
}