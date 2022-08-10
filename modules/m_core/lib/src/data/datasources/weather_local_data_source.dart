import 'package:m_core/m_core.dart';

///
/// Created by handy on 10/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

abstract class WeatherLocalDataSource {
  Future<String> insertDataWeather(WeatherTable weatherTable);
  Future<String> removeDataWeather();
  Future<List<WeatherTable>> getDataWeather();
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {

  final DatabaseHelper databaseHelper;

  WeatherLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<List<WeatherTable>> getDataWeather() async {
    try {
      final result = await databaseHelper.getDataWeather();
      return result.map((e) => WeatherTable.fromJson(e)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> insertDataWeather(WeatherTable weatherTable) async {
    try {
      await databaseHelper.insertWeather(weatherTable);
      return 'added data weather';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeDataWeather() async {
    try {
      await databaseHelper.deleteDataWeather();
      return 'removed data weather';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

}