import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:islamic_book_reader/BookReading/data/datasources/local_bookReading_datasource.dart';
import 'package:islamic_book_reader/BookReading/data/datasources/remote_bookReading_datasource.dart';
import 'package:islamic_book_reader/BookReading/domain/repository/bookReading_repository.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/add_to_localDatabase_usecase.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_Book_list_from_localDatabase_usecase.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_from_firebase_usecase.dart';
import 'package:islamic_book_reader/BookReading/domain/usecases/get_from_localDatabase_usecase.dart';
import 'package:islamic_book_reader/essentials/databaseHelper.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  FirebaseFirestore,
  CollectionReference, 
  QuerySnapshot, 
  QueryDocumentSnapshot,
  DatabaseHelper,
  LocalBookReadingDatasource,
  RemoteBookReadingDatasource,
  BookReadingRepository,
  AddToLocaldatabaseUsecase,
  GetBookListFromLocalDatabaseUsecase,
  GetFromFirebaseUsecase,
  GetFromLocalDatabaseUsecase,

])

void main() {}