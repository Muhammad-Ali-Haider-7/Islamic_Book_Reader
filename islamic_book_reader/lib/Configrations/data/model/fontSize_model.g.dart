// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fontSize_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FontSizeModelImpl _$$FontSizeModelImplFromJson(Map<String, dynamic> json) =>
    _$FontSizeModelImpl(
      heading: (json['heading'] as num).toInt(),
      content: (json['content'] as num).toInt(),
      arabic: (json['arabic'] as num).toInt(),
    );

Map<String, dynamic> _$$FontSizeModelImplToJson(_$FontSizeModelImpl instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'content': instance.content,
      'arabic': instance.arabic,
    };
