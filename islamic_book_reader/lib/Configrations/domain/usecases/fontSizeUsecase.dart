import 'package:dartz/dartz.dart';
import 'package:islamic_book_reader/Configrations/domain/entity/fontSize_entity.dart';
import 'package:islamic_book_reader/Configrations/domain/repository/config_repository.dart';
import 'package:islamic_book_reader/essentials/failure.dart';

class FontSizeUsecase{

  final ConfigRepository configRepository;

  const FontSizeUsecase({
    required this.configRepository,
  }
  );

  Future<Either<LocalDatabaseFailure, void>> updateConfig({required int heading,required int content , required int arabic }) {
    return configRepository.updateConfig(heading: heading, content: content, arabic: arabic);
  }

  Future<Either<LocalDatabaseFailure, FontSizeEntity>> getConfig()async{
    return configRepository.getConfig();
  }
}