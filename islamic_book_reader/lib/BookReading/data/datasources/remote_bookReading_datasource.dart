import 'package:cloud_firestore/cloud_firestore.dart';




class RemoteBookReadingDatasource {

  RemoteBookReadingDatasource({required this.firestore});
  final FirebaseFirestore firestore;

  
  Future<List<Map<String, dynamic>>> getBooksFromFirestore() async {
  List<Map<String, dynamic>> dataList = [];

  try {
    // Get the reference to the Firestore collection
    CollectionReference collectionRef = firestore.collection("Book");

    // Fetch the data from the collection
    QuerySnapshot querySnapshot = await collectionRef.get();

    // Process the data
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      dataList.add(doc.data() as Map<String, dynamic>);
    }
  } catch (e) {
    print('Error fetching data: $e');
  }

  return dataList;
}

Future<List<Map<String, dynamic>>> getHeadingFromFirestore({required String BookId}) async {
  List<Map<String, dynamic>> dataList = [];

  try {
    // Get the reference to the Firestore collection
    CollectionReference collectionRef = firestore.collection("Book").doc(BookId).collection("Heading");

    // Fetch the data from the collection
    QuerySnapshot querySnapshot = await collectionRef.get();

    // Process the data
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      dataList.add(doc.data() as Map<String, dynamic>);
    }
  } catch (e) {
    print('Error fetching data: $e');
  }

  return dataList;
}


Future<List<Map<String, dynamic>>> getContentFromFirestore({required String BookId, required String HeadingId}) async {
  List<Map<String, dynamic>> dataList = [];

  try {
    // Get the reference to the Firestore collection
    CollectionReference collectionRef = firestore.collection("Book").doc(BookId).collection("Heading").doc(HeadingId).collection("Content");

    // Fetch the data from the collection
    QuerySnapshot querySnapshot = await collectionRef.get();

    // Process the data
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      dataList.add(doc.data() as Map<String, dynamic>);
    }
  } catch (e) {
    print('Error fetching data: $e');
  }

  return dataList;
}

Future<List<Map<String, dynamic>>> getArabicFromFirestore({required String BookId,required  String HeadingId,required String ContentId}) async {
  List<Map<String, dynamic>> dataList = [];

  try {
    // Get the reference to the Firestore collection
    CollectionReference collectionRef = firestore.collection("Book").doc(BookId).collection("Heading").doc(HeadingId).collection("Content").doc(ContentId).collection("Arabic");

    // Fetch the data from the collection
    QuerySnapshot querySnapshot = await collectionRef.get();

    // Process the data
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      dataList.add(doc.data() as Map<String, dynamic>);
    }
  } catch (e) {
    print('Error fetching data: $e');
  }

  return dataList;
}
}