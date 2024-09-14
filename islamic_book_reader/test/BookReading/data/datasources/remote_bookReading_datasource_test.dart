import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_book_reader/BookReading/data/datasources/remote_bookReading_datasource.dart';
import 'package:mockito/mockito.dart';

import '../../_utils/jsonReader.dart';
import '../../_utils/mocks/mocks.mocks.dart';




void main(){
  late FirebaseFirestore mockFirebaseFirestore;
  late RemoteBookReadingDatasource remoteBookReadingDatasource;
  late Map<String,dynamic> dummydata;


  setUpAll((){
    mockFirebaseFirestore = MockFirebaseFirestore();
    remoteBookReadingDatasource = MockRemoteBookReadingDatasource();
    dummydata = jsonReader("books_dummy_data.json");
  });

  test('should return books when getBooksFromFirestore is called', () async {
    final jsonString = jsonReader("books_dummy_data.json");
    final Map<String,dynamic> jsonData = jsonString;

    print(jsonString.runtimeType);


    print(jsonData.runtimeType);
    print(jsonData);

    Map<String,dynamic> extractBooks(Map<String,dynamic> jsonData){
      
      final data = jsonData["Book"];
      return data;
    } 
    
    final Map<String,dynamic> bookData = extractBooks(jsonData);

    
    when(remoteBookReadingDatasource.getBooksFromFirestore()).thenAnswer((_) async => [bookData]);


    // Act
    final result = await remoteBookReadingDatasource.getBooksFromFirestore();

    print(bookData.runtimeType);
    // Assert
    expect(result, equals([dummydata["Book"]]));
  });


}