import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/books_entity.dart';

part 'books_model.freezed.dart'; // Include this line
part 'books_model.g.dart';       // Include this line

@freezed
class BookModel  extends BooksEntity with _$BookModel {
  factory BookModel({
    required String id,
    required String name,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) => _$BookModelFromJson(json);
}


