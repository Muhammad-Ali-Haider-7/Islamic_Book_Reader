part of "bloc_BookReading.dart";

class ReadingBlocEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

// class ReadFromRemoteResourceEvent extends ReadingBlocEvent {

//   List<Object?> get props => [];
// }


class ReadBooksFromLocalResourceEvent extends ReadingBlocEvent {

  List<Object?> get props => [];
}

class ReadFromLocalResourceEvent extends ReadingBlocEvent {
  ReadFromLocalResourceEvent({
    required this.bookId,
  });

  final BooksEntity bookId;

  List<Object?> get props => [bookId];
}

class FilterBooksEvent extends ReadingBlocEvent {
  FilterBooksEvent({
    required this.searchQuery,
  });

  final String searchQuery;

  List<Object?> get props => [searchQuery];
}