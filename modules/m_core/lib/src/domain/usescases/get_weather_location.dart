import 'package:dartz/dartz.dart';
import 'package:m_core/m_core.dart';

///
/// Created by handy on 10/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

class GetWeatherLocation {

  final WeatherLocationRepository repository;

  GetWeatherLocation(this.repository);

  Future<Either<Failure,WeatherResponse>> getWeatherLocation(String longitude, String latitude) {
    return repository.getWeatherLocation(longitude, latitude);
  }

}