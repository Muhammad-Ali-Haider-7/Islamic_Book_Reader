import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:islamic_book_reader/Configrations/domain/entity/fontSize_entity.dart';



part 'fontSize_model.freezed.dart'; // Include this line
part 'fontSize_model.g.dart';       // Include this line

@freezed
class FontSizeModel extends FontSizeEntity with _$FontSizeModel{

  factory FontSizeModel({
    required int heading,
    required int content,
    required int arabic,
  }) = _FontSizeModel;

  factory FontSizeModel.fromJson(Map<String, dynamic> json) => _$FontSizeModelFromJson(json);
}