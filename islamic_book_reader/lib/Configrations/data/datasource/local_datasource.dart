import 'package:islamic_book_reader/Configrations/data/model/fontSize_model.dart';
import 'package:islamic_book_reader/essentials/databaseHelper.dart';

class LocalDatasource{

  const LocalDatasource({
    required this.instance,
  });

  final DatabaseHelper instance;


  Future<void> updateConfig({required int heading,required int content , required int arabic }) async {
    try{
      // return await instance.updateConfig(key: key,value: value);
      return await instance.updateConfig(heading, content, arabic);
    }
    catch(e){
      print("Error setting config from local Datasource $e" );
    }
  }

  Future<FontSizeModel> getConfig()async{
    try{
      return await instance.getConfig();
    }
    catch(e){
      print("Error getting config from local Datasource $e" );
      throw e;
    }
  }

  

}