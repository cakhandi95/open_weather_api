import 'package:dartz/dartz.dart';
import 'package:m_core/src/data/models/weather_response.dart';
import 'package:m_core/src/utils/failure.dart';

///
/// Created by handy on 10/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

abstract class WeatherLocationRepository {
  Future<Either<Failure,WeatherResponse>> getWeatherLocation(String longitude, String latitude);
}