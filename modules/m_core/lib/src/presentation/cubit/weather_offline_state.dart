import 'package:equatable/equatable.dart';
import 'package:m_core/m_core.dart';

///
/// Created by handy on 10/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

class WeatherOfflineState extends Equatable {
  const WeatherOfflineState();

  @override
  List<Object?> get props => [];
}

class WeatherOfflineInitState extends WeatherOfflineState {
  const WeatherOfflineInitState();
}

class WeatherOfflineSuccessState extends WeatherOfflineState {
  final String message;

  const WeatherOfflineSuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

class WeatherOfflineFailedState extends WeatherOfflineState {
  final String message;

  const WeatherOfflineFailedState({required this.message});

  @override
  List<Object?> get props => [message];
}

class WeatherOfflineLoadedState extends WeatherOfflineState {
  final List<WeatherTable>? items;

  const WeatherOfflineLoadedState({required this.items});

  @override
  List<Object?> get props => [items];
}