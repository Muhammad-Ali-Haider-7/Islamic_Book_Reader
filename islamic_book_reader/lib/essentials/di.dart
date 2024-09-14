import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:islamic_book_reader/essentials/databaseHelper.dart';



final GetIt getIt = GetIt.instance;

Future<void> SetUp() async {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DatabaseHelper databaseHelper = DatabaseHelper();

  getIt.registerLazySingleton(
    ()=>firestore
  );
  getIt.registerLazySingleton(
    ()=>databaseHelper
  );
}