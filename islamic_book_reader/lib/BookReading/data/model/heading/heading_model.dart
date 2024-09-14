import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/heading_entity.dart';

part "heading_model.freezed.dart";
part "heading_model.g.dart";

@freezed
class HeadingModel extends HeadingEntity with _$HeadingModel{

  factory HeadingModel({
    required String id,
    required String heading,
    required String bookId,
    required int headingIndex,
  }) = _HeadingModel;

  factory HeadingModel.fromJson(Map<String, dynamic> json) => _$HeadingModelFromJson(json);
  
}