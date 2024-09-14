// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heading_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HeadingModelImpl _$$HeadingModelImplFromJson(Map<String, dynamic> json) =>
    _$HeadingModelImpl(
      id: json['id'] as String,
      heading: json['heading'] as String,
      bookId: json['bookId'] as String,
      headingIndex: int.parse(json['headingIndex']) as int,
    );

Map<String, dynamic> _$$HeadingModelImplToJson(_$HeadingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'heading': instance.heading,
      'bookId': instance.bookId,
      'headingIndex': instance.headingIndex,
    };
