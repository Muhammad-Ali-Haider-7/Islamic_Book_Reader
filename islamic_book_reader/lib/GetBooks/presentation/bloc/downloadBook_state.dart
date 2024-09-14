part of "downloadBook_bloc.dart";

class DownloadbookState extends Equatable{
  const DownloadbookState();
  @override
  List<Object?> get props => [];
}

class DownloadbookInitial extends DownloadbookState{
  const DownloadbookInitial();

}

class DownloadbookSuccess extends DownloadbookState{
  const DownloadbookSuccess();

}

class DownloadbookLoading extends DownloadbookState{
  const DownloadbookLoading();

}

class DownloadViewBooksListBlocSuccess extends DownloadbookState{
  const DownloadViewBooksListBlocSuccess({
    required this.book,
  });

  final List<BooksEntity> book;

  @override
  List<Object?> get props => [book];
}

class DownloadbookError extends DownloadbookState{
  const DownloadbookError({
      required this.msg
    });

  final String msg;

  @override
  List<Object?> get props =>[msg];

}

