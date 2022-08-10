import 'package:dartz/dartz.dart';
import 'package:m_core/m_core.dart';

///
/// Created by Handy on 10/08/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class WeatherOfflineRepositoryImpl extends WeatherOfflineRepository {

  final WeatherLocalDataSource localDataSource;

  WeatherOfflineRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<WeatherTable>?>> getDataWeather() async {
    try {
      final result = await localDataSource.getDataWeather();
      return Right(result.map((data) => data.toEntity()).toList());
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<Either<Failure, String>> insertDataWeather(WeatherTable weatherTable) async {
    try {
      final result = await localDataSource.insertDataWeather(weatherTable);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure('0',e.message));
    } catch (e) {
      return Left(CommonFailure('0',"insert_data_weather: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, String>> removeDataWeather() async {
    try {
      final result = await localDataSource.removeDataWeather();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure('0',e.message));
    } catch (e) {
      return Left(CommonFailure('0',"remove_data_weather: ${e.toString()}"));
    }
  }

}
