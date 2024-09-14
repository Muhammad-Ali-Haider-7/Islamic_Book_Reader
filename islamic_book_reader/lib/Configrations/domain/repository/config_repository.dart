import 'package:dartz/dartz.dart';
import 'package:islamic_book_reader/Configrations/domain/entity/fontSize_entity.dart';
import 'package:islamic_book_reader/essentials/failure.dart';

abstract class ConfigRepository{

  Future<Either<LocalDatabaseFailure,void>> updateConfig({required int heading,required int content , required int arabic });

  Future<Either<LocalDatabaseFailure,FontSizeEntity>> getConfig();

}