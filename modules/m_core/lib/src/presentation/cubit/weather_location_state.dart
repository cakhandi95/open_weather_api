import 'package:equatable/equatable.dart';
import 'package:m_core/m_core.dart';

///
/// Created by handy on 10/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

class WeatherLocationState extends Equatable {

  const WeatherLocationState();

  @override
  List<Object?> get props => [];

}

class WeatherLocationInitState extends WeatherLocationState {
  const WeatherLocationInitState();
}

class WeatherLocationLoadingState extends WeatherLocationState {
  const WeatherLocationLoadingState();
}

class WeatherLocationLoadedState extends WeatherLocationState {
  final WeatherResponse weatherResponse;

  const WeatherLocationLoadedState(this.weatherResponse);

  @override
  List<Object?> get props => [weatherResponse];
}

class WeatherLocationErrorState extends WeatherLocationState {

  final String message;

  const WeatherLocationErrorState(this.message);

  @override
  List<Object?> get props => [message];
}