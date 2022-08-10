import 'package:dartz/dartz.dart';
import 'package:m_core/m_core.dart';

///
/// Created by Handy on 10/08/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class RemoveWeatherOffline {

  final WeatherOfflineRepository repository;

  RemoveWeatherOffline(this.repository);

  Future<Either<Failure,String>> execute() async {
    return repository.removeDataWeather();
  }

}

