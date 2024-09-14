import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/content_entity.dart';


part "content_model.freezed.dart";
part "content_model.g.dart";

@freezed
class ContentModel extends ContentEntity with _$ContentModel{

factory ContentModel({
  required String headingId,
  required String content,
  required String id,
}) = _ContentModel;

factory ContentModel.fromJson(Map<String, dynamic> json) => _$ContentModelFromJson(json);

}