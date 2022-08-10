import 'package:dartz/dartz.dart';
import 'package:m_core/m_core.dart';

///
/// Created by Handy on 10/08/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class GetWeatherOffline {

  final WeatherOfflineRepository repository;

  GetWeatherOffline(this.repository);

  Future<Either<Failure,List<WeatherTable>?>> execute() async{
    return repository.getDataWeather();
  }

}
