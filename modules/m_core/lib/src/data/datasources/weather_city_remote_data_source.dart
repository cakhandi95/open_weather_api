import 'package:m_core/m_core.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

///
/// Created by handy on 09/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

abstract class WeatherCityRemoteDataSource {
  Future<WeatherResponse> getWeatherCity(String city, String longitude, String latitude);
}

class WeatherCityRemoteDataSourceImpl implements WeatherCityRemoteDataSource {

  final http.Client client;

  WeatherCityRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherResponse> getWeatherCity(String city, String longitude, String latitude) async {

    String? url;
    String apiKey = ConfigApp.apiKEY;

    url = "${ConfigApp.baseURL}?lat=$latitude&lon=$longitude&appid=$apiKey&q=$city";

    final response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException(NetworkUtils.code(response.statusCode.toString()), response.statusCode.toString());
    }
  }

}