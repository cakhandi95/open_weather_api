import 'package:dartz/dartz.dart';
import 'package:m_core/m_core.dart';

///
/// Created by Handy on 10/08/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

abstract class WeatherOfflineRepository {

  /// Local Database Resource
  Future<Either<Failure,String>> insertDataWeather(WeatherTable weatherTable);
  Future<Either<Failure,List<WeatherTable>?>> getDataWeather();
  Future<Either<Failure,String>> removeDataWeather();

}