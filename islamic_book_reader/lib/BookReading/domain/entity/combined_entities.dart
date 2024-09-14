
import 'package:islamic_book_reader/BookReading/domain/entity/arabic_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/books_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/content_entity.dart';
import 'package:islamic_book_reader/BookReading/domain/entity/heading_entity.dart';

class CombinedEntityBook{
  const CombinedEntityBook({
    required this.book,
    required this.combinedEntityHeading
  });

  final BooksEntity book;
  final List<CombinedEntityHeading> combinedEntityHeading;
}


class CombinedEntityHeading{
  const CombinedEntityHeading({
    required this.heading,
    required this.combinedEntityContent
  });

  final HeadingEntity heading;
  final List<CombinedEntityContent> combinedEntityContent;
}


class CombinedEntityContent {
  const CombinedEntityContent({
    required this.content,
    required this.arabic
  });

  final ContentEntity content;
  final List<ArabicEntity> arabic;
}