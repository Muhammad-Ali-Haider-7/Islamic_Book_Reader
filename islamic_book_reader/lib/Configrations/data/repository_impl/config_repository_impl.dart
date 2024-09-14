import 'package:dartz/dartz.dart';
import 'package:islamic_book_reader/Configrations/data/datasource/local_datasource.dart';
import 'package:islamic_book_reader/Configrations/data/model/fontSize_model.dart';
import 'package:islamic_book_reader/Configrations/domain/repository/config_repository.dart';
import 'package:islamic_book_reader/essentials/failure.dart';

class ConfigRepositoryImpl implements ConfigRepository{

  final LocalDatasource localDatasource;

  const ConfigRepositoryImpl(
    this.localDatasource,
  );

  @override
  Future<Either<LocalDatabaseFailure, FontSizeModel>> getConfig() async{
    try{
      final result = await localDatasource.getConfig();
      return Right(result);
    }
    catch (e){
      print("error from repo impl: $e");
      return Left(LocalDatabaseFailure());
    }
  }

  @override
  Future<Either<LocalDatabaseFailure, void>> updateConfig({required int heading, required int content, required int arabic}) async {
    try{
      return Right(localDatasource.updateConfig(heading: heading, content: content, arabic: arabic));
    }
    catch(e){
      print("error from repo impl: $e");
      return Left(LocalDatabaseFailure());
    }
  }

  

}