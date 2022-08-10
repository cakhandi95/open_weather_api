import 'package:equatable/equatable.dart';
import 'package:m_core/m_core.dart';

///
/// Created by handy on 10/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

class WeatherCityState extends Equatable {

  const WeatherCityState();

  @override
  List<Object?> get props => [];

}

class WeatherCityInitState extends WeatherCityState {
  const WeatherCityInitState();
}

class WeatherCityLoadingState extends WeatherCityState {
  const WeatherCityLoadingState();
}

class WeatherCityLoadedState extends WeatherCityState {
  final WeatherResponse weatherResponse;

  const WeatherCityLoadedState(this.weatherResponse);

  @override
  List<Object?> get props => [weatherResponse];
}

class WeatherCityErrorState extends WeatherCityState {

  final String httpStatus;
  final String message;

  const WeatherCityErrorState({required this.httpStatus, required this.message});

  @override
  List<Object?> get props => [httpStatus, message];
}