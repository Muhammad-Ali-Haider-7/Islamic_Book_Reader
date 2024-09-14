import 'package:islamic_book_reader/BookReading/data/model/arabic/arabic_model.dart';
import 'package:islamic_book_reader/BookReading/data/model/books/books_model.dart';
import 'package:islamic_book_reader/BookReading/data/model/content/content_model.dart';
import 'package:islamic_book_reader/BookReading/data/model/heading/heading_model.dart';
import 'package:islamic_book_reader/essentials/databaseHelper.dart';
import 'package:logging/logging.dart';


class LocalBookReadingDatasource {

  LocalBookReadingDatasource({
    required this.instance,
  });

  final Logger logger = Logger('LocalBookReadingDatasource');
  final DatabaseHelper instance;

  

  Future<void> addWholeBook({required BookModel book,required List<HeadingModel> headings,required List<ContentModel> Contents,required List<ArabicModel> Arabics})async {
    try{
      return await instance.addWholeBook(book,headings,Contents,Arabics);
    }
    catch(e){
      logger.severe("Error setting books from local Datasource $e" );
    }
  }

  Future<void> addBook({required BookModel book}) async {
    try{
      print(book);
    return await instance.addBooks(book);
      }
    catch(e){
      logger.severe("Error setting books from local Datasource $e" );
    }
  }
  
  Future<void> addHeadings({required List<HeadingModel> headings}) async {
    try{
      // print("books added");
      return await instance.addHeadings(headings);
    }
    catch(e){
      logger.severe("Error setting headings from local Datasource $e" );
    }
  }

  Future<void> addContents({required List<ContentModel> Contents}) async {
    try{
      // print("heading added");
      return await instance.addContents(Contents);
    }
    catch(e){
      logger.severe("Error setting content from local Datasource $e" );
    }
  }

  Future<void> addArabics({required List<ArabicModel> Arabics}) async {
    try{

      // print("content added");
      return await instance.addArabic(Arabics);
    }
    catch(e){
      logger.severe("Error setting Arabics from local Datasource $e" );
    }
  }

  Future<List<BookModel>> getBooks() async{
    try{
      return await instance.getBooks();
    }
    catch(e){
      logger.severe("Error setting headings from local Datasource $e" );
      throw Exception("Error setting headings from local Datasource $e");
    }
  }

  Future<List<HeadingModel>> getHeadings({required String BookId}) async {
    try{
      return await instance.getHeadings(BookId);
    }
    catch(e){
      logger.severe("Error setting headings from local Datasource $e" );
      throw Exception("Error setting headings from local Datasource $e");
    }
  }

  Future<List<ContentModel>> getContent({required String headingId}) async {
    try{
      return await instance.getContent(headingId);
    }
    catch(e){
      logger.severe("Error setting headings from local Datasource $e" );
      throw Exception("Error setting headings from local Datasource $e");
    }
  }


  Future<List<ArabicModel>> getArabic({required String contentId}) async {
    try{
      return await instance.getArabic(contentId);
    }
    catch(e){
      logger.severe("Error setting headings from local Datasource $e" );
      throw Exception("Error setting headings from local Datasource $e");
    }
  }

  
}

