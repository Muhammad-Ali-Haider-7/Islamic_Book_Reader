part of "bloc_BookReading.dart";

class ReadingBlocState extends Equatable{
  const ReadingBlocState();
  @override

  List<Object?> get props => [];

}

class ReadingBlocSuccess extends ReadingBlocState{
  const ReadingBlocSuccess({
    required this.book,
  });

  final CombinedEntityBook book;

  @override
  List<Object?> get props => [book];
}

class ReadingBooksListBlocSuccess extends ReadingBlocState{
  const ReadingBooksListBlocSuccess({
    required this.book,
  });

  final List<BooksEntity> book;

  @override
  List<Object?> get props => [book];
}



class ReadingBlocInitial extends ReadingBlocState{
  const ReadingBlocInitial();

  @override
  List<Object?> get props => [];
}

class ReadingBlocLoading extends ReadingBlocState{
  const ReadingBlocLoading();

  @override
  List<Object?> get props => [];
}

class ReadingBlocError extends ReadingBlocState{
  const ReadingBlocError({
    required this.msg,
  });

  final String msg;

  @override
  List<Object?> get props => [msg];
}