part of 'settings_bloc.dart';

class SettingsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeFontSizeEvent extends SettingsEvents {
  final int heading;
  final int content;
  final int arabic;

  ChangeFontSizeEvent({
    required this.heading,
    required this.content,
    required this.arabic,
  });

  @override
  List<Object> get props => [heading, content, arabic];
}

class GetFontSizeEvent extends SettingsEvents {
}