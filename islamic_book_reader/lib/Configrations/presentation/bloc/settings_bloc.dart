import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_book_reader/Configrations/domain/entity/fontSize_entity.dart';
import 'package:islamic_book_reader/Configrations/domain/usecases/fontSizeUsecase.dart';

part "settings_events.dart";
part "settings_states.dart";

class SettingsBloc extends Bloc<SettingsEvents,SettingsStates> {
  SettingsBloc({
    required this.fontSizeUsecase,
  
  }):super(SettingsInitial()){
    on<ChangeFontSizeEvent>(_onChangeFontSize);
    on<GetFontSizeEvent>(_onGetFontSize);
  }


  final FontSizeUsecase fontSizeUsecase;

  void _onGetFontSize(GetFontSizeEvent event, Emitter<SettingsStates> emit) async {
    try{
    emit(SettingsLoading());
    final result = await fontSizeUsecase.getConfig();
    result.fold(
      (failure) => emit(SettingsError(msg: failure.toString())),
      (success) => emit(SettingsSuccessGet(fontSizeEntity: success)),
    );
    }
    catch(e){
      emit(SettingsError(msg: e.toString()));
    }
  }

  void _onChangeFontSize(ChangeFontSizeEvent event, Emitter<SettingsStates> emit) async {
    try{
    emit(SettingsLoading());
    final result = await fontSizeUsecase.updateConfig(
      heading: event.heading,
      content: event.content,
      arabic: event.arabic,
    );

    result.fold(
      (failure) => emit(SettingsError(msg: failure.toString())),
      (success) => emit(SettingsSuccessUpdate()),
    );
    }
    catch(e){
      emit(SettingsError(msg: e.toString()));
    }
  }


  

}