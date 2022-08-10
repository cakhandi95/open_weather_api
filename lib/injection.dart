import 'package:get_it/get_it.dart';
import 'package:m_core/m_core.dart';

///
/// Created by handy on 09/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

final locator = GetIt.instance;

void init() {

  /// TODO HANDY : CUBIT
  locator.registerFactory(
          () => WeatherCityCubit(
          getWeatherCity: locator()
      )
  );

  locator.registerFactory(
          () => WeatherLocationCubit(
          getWeatherLocation: locator()
      )
  );

  locator.registerFactory(
          () => WeatherOfflineCubit(
          removeWeatherOffline: locator(),
          insertWeatherOffline: locator(),
          getWeatherOffline: locator()
      )
  );

  /// TODO HANDY : USECASES
  locator.registerLazySingleton(() => GetWeatherOffline(locator()));
  locator.registerLazySingleton(() => InsertWeatherOffline(locator()));
  locator.registerLazySingleton(() => RemoveWeatherOffline(locator()));

  locator.registerLazySingleton(() => GetWeatherCity(locator()));
  locator.registerLazySingleton(() => GetWeatherLocation(locator()));

  /// TODO HANDY : m_core/lib/src/data/repositories/
  locator.registerLazySingleton<WeatherCityRepository>(
        () => WeatherCityRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<WeatherLocationRepository>(
        () => WeatherLocationRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<WeatherOfflineRepository>(
        () => WeatherOfflineRepositoryImpl(
      localDataSource: locator(),
    ),
  );

  /// TODO HANDY : data/datasources/xxxx_local_data_source.dart
  locator.registerLazySingleton<WeatherLocalDataSource>(
        () => WeatherLocalDataSourceImpl(
      databaseHelper: locator(),
    ),
  );

  locator.registerLazySingleton<WeatherCityRemoteDataSource>(
        () => WeatherCityRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  locator.registerLazySingleton<WeatherLocationRemoteDataSource>(
        () => WeatherLocationRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  /// TODO HANDY : Database
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  /// TODO HANDY : HTTPSSLPinning
  locator.registerLazySingleton(() => HttpSSLPinning.client);
}