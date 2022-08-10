import 'package:dartz/dartz.dart';
import 'package:m_core/m_core.dart';

///
/// Created by Handy on 10/08/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class InsertWeatherOffline {

  final WeatherOfflineRepository repository;

  InsertWeatherOffline(this.repository);

  Future<Either<Failure,String>> execute(WeatherTable weatherTable) async {
    return repository.insertDataWeather(weatherTable);
  }

}
