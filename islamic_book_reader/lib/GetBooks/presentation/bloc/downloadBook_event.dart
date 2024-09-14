part of "downloadBook_bloc.dart";

class DownloadbookEvent extends Equatable{

  const DownloadbookEvent();

  @override
  List<Object?> get props => [];
}

class DownloadBookFromRemoteResourceEvent extends DownloadbookEvent {
  DownloadBookFromRemoteResourceEvent({required this.bookName,required this.bookId});

  final String bookId;
  final String bookName;

  List<Object?> get props => [bookId];
}

class DownloadViewFromRemoteResourceEvent extends DownloadbookEvent {
  const DownloadViewFromRemoteResourceEvent();

  List<Object?> get props => [];
}



