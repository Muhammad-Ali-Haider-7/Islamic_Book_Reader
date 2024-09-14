import 'dart:async';
import 'package:islamic_book_reader/BookReading/data/model/arabic/arabic_model.dart';
import 'package:islamic_book_reader/BookReading/data/model/books/books_model.dart';
import 'package:islamic_book_reader/BookReading/data/model/content/content_model.dart';
import 'package:islamic_book_reader/BookReading/data/model/heading/heading_model.dart';
import 'package:islamic_book_reader/Configrations/data/model/fontSize_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<void> deleteDatabaseFile() async {
    String path = join(await getDatabasesPath(), 'books_database.db');
    await deleteDatabase(path);
    _database = null; // Reset the database instance
    print("Database deleted");
  }


  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'books_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Books (
        dbId INTEGER PRIMARY KEY AUTOINCREMENT,
        id TEXT UNIQUE,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Headings (
        dbId INTEGER PRIMARY KEY AUTOINCREMENT,
        id TEXT UNIQUE,
        bookId TEXT,
        heading TEXT,
        headingIndex INTEGER ,
        FOREIGN KEY (bookId) REFERENCES Books (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE Content (
        dbId INTEGER PRIMARY KEY AUTOINCREMENT,
        id TEXT UNIQUE,
        headingId TEXT,
        content TEXT,
        FOREIGN KEY (headingId) REFERENCES Headings (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE Arabic (
        dbId INTEGER PRIMARY KEY AUTOINCREMENT,
        id TEXT UNIQUE,
        arabic TEXT,
        contentId TEXT,
        FOREIGN KEY (contentId) REFERENCES Content (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE Config(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        heading INTEGER,
        content INTEGER,
        arabic INTEGER
      )
    ''');

    await db.insert("Config", {"heading":26,"content":20,"arabic":16});

  }

  Future<void> addConfig(int heading,int content,int arabic) async {
    Database db = await database;
    await db.insert("Config", {"heading":heading,"content":content,"arabic":arabic});
  }

  Future<void> updateConfig(int heading,int content,int arabic) async {
    Database db = await database;
    await db.update("Config", {"heading":heading,"content":content,"arabic":arabic},where: "id = ?",whereArgs: [1]);
  }

  Future<FontSizeModel> getConfig() async {
    Database db = await database;
    final result = await db.query("Config");
    
    return FontSizeModel.fromJson(result[0]);

  }


  Future<void> addWholeBook(BookModel book,List<HeadingModel> headings,List<ContentModel> contents,List<ArabicModel> arabics) async {
    Database db = await database;
    Batch batch = db.batch();

    batch.insert("Books", book.toJson());
    for (HeadingModel heading in headings) {
      batch.insert('Headings', heading.toJson());
    }
    for (ContentModel content in contents) {
      batch.insert('Content', content.toJson());
    }
    for (ArabicModel arabic in arabics) {
      batch.insert('Arabic', arabic.toJson());
    }

    await batch.commit(noResult: true);

  }

  Future<void> addBooks(BookModel book) async {
    try{
     Database db = await database;
     await db.insert("Books", book.toJson());
     print("Book added");
     print(await db.query("Books"));
    }catch(e , stacktrace){
      print("Error from database helper while adding Book $e with $stacktrace");
    }
  }

  Future<void> addHeadings(List<HeadingModel> headings) async {
    try{
    Database db = await database;
    Batch batch = db.batch();
    for (HeadingModel heading in headings) {
      batch.insert('Headings', heading.toJson());
    }
    await batch.commit(noResult: true);
    }catch(e, stacktrace){
      print("Error from database helper while adding heading $e with $stacktrace");
    }
  }

  Future<void> addContents(List<ContentModel> contents) async {
    try{
      Database db = await database;
      Batch batch = db.batch();
      for (ContentModel content in contents) {
        // print("heading id is -- ${content.headingId} ,  id is -- ${content.id}");
        batch.insert('Content', content.toJson());
      }
      await batch.commit(noResult: true);
    }catch(e, stacktrace){
      print("Error from database helper while adding content $e with $stacktrace");
    }
    }

  Future<void> addArabic(List<ArabicModel> arabics) async {
    try{
    Database db = await database;
    Batch batch = db.batch();
    for (ArabicModel arabic in arabics) {
      // print("content id is -- ${arabic.contentId} ,  id is -- ${arabic.id}");
      batch.insert('Arabic', arabic.toJson());
    }
    await batch.commit(noResult: true);
    }
    catch(e, stacktrace){

      print("Error from database helper while adding Arabic $e with $stacktrace");
    }
  }


  Future<List<BookModel>> getBooks() async{
    Database db = await database;
    final results = await db.query("Books");

    List<BookModel> bms = [];

    for(Map<String,Object?> result in results){
      bms.add(BookModel.fromJson(result));
    }
    return bms;

  }


  Future<List<HeadingModel>> getHeadings(String BookId) async{

    Database db = await database;

    print(await db.query("Headings"));

    final result = await db.query(
      'Headings',
      where: 'bookId = ?',
      whereArgs: [BookId],
      orderBy: 'headingIndex ASC',
    );

    return List.generate(result.length, (i){
      // print(result[i]);
      return HeadingModel(bookId: result[i]["bookId"].toString(),heading: result[i]["heading"].toString(),headingIndex: int.parse(result[i]["headingIndex"].toString()),id: result[i]["id"].toString());
      // return HeadingModel.fromJson(result[i]);
    });
  }


  Future<List<ContentModel>> getContent(String HeadingId) async{

      Database db = await database;

      final result = await db.query(
        'Content',
        where: 'headingId = ?',
        whereArgs: [HeadingId],
        orderBy: 'dbId DESC',
      );

      return List.generate(result.length, (i){
        return ContentModel.fromJson(result[i]);
      });
    }

    Future<List<ArabicModel>> getArabic(String contentId) async{

      Database db = await database;

      final result = await db.query(
        'Arabic',
        where: 'contentId = ?',
        whereArgs: [contentId],
        orderBy: 'dbId DESC',
      );

      return List.generate(result.length, (i){
        return ArabicModel.fromJson(result[i]);
      });
    }
  

  Future<int> deleteBook(String id) async {
    Database db = await database;
    return await db.delete(
      'books',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
