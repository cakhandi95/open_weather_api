import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:m_core/m_core.dart';

///
/// Created by handy on 10/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

class WeatherLocationRepositoryImpl extends WeatherLocationRepository  {

  final WeatherLocationRemoteDataSource remoteDataSource;

  WeatherLocationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherResponse>> getWeatherLocation(String longitude, String latitude) async {
    try {
      final result = await remoteDataSource.getWeatherLocation(longitude, latitude);
      return Right(result.toJson());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.httpStatus.toString(), e.message));
    } on SocketException {
      return const Left(ConnectionFailure('0','Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('0','Certificated not valid ${e.message}'));
    } catch (e) {
      return Left(CommonFailure('0',"weather_city : ${e.toString()}"));
    }
  }

}