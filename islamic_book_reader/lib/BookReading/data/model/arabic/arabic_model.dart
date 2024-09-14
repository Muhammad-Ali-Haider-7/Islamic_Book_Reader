import 'package:islamic_book_reader/BookReading/domain/entity/arabic_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'arabic_model.freezed.dart';
part 'arabic_model.g.dart';

@freezed
class ArabicModel extends ArabicEntity with _$ArabicModel{
  factory ArabicModel({
    required String contentId,
    required String arabic,
    required String id,
  }) = _ArabicModel;

  factory ArabicModel.fromJson(Map<String, dynamic> json) => _$ArabicModelFromJson(json);


}