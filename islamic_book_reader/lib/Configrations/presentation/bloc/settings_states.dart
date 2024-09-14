part of "settings_bloc.dart";

class SettingsStates extends Equatable {
  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsStates{
}

class SettingsLoading extends SettingsStates{
}

class SettingsSuccessGet extends SettingsStates{
  final FontSizeEntity fontSizeEntity;

  SettingsSuccessGet({
    required this.fontSizeEntity,
  });

  @override
  List<Object> get props => [fontSizeEntity];
}

class SettingsSuccessUpdate extends SettingsStates{
}

class SettingsError extends SettingsStates{
  final String msg;

  SettingsError({
    required this.msg,
  });

  @override
  List<Object> get props => [msg];
}