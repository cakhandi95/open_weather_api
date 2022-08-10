import 'package:dartz/dartz.dart';
import 'package:m_core/m_core.dart';

///
/// Created by handy on 10/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

class GetWeatherCity {

  final WeatherCityRepository repository;

  GetWeatherCity(this.repository);

  Future<Either<Failure,WeatherResponse>> execute(String city, String longitude, String latitude){
    return repository.getWeatherCity(city, longitude, latitude);
  }

}