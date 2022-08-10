import 'package:m_core/m_core.dart';

///
/// Created by handy on 10/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

class WeatherOfflineCubit extends Cubit<WeatherOfflineState> {
  
  final InsertWeatherOffline insertWeatherOffline;
  final RemoveWeatherOffline removeWeatherOffline;
  final GetWeatherOffline getWeatherOffline;
  
  WeatherOfflineCubit({required this.insertWeatherOffline, required this.removeWeatherOffline, required this.getWeatherOffline}) : super(const WeatherOfflineInitState());

  Future<void> get() async {
    emit(const WeatherOfflineInitState());

    final result = await getWeatherOffline.execute();

    result.fold((failure) => emit(WeatherOfflineFailedState(message: failure.message)), (data) => {
      emit(WeatherOfflineLoadedState(items: data))
    });
  }

  Future<void> insert(WeatherTable weatherTable) async {
    emit(const WeatherOfflineInitState());

    final result = await insertWeatherOffline.execute(weatherTable);

    result.fold((failure) => emit(WeatherOfflineFailedState(message: failure.message)), (message) => {
      emit(WeatherOfflineSuccessState(message: message))
    });
  }

  Future<void> remove() async {
    emit(const WeatherOfflineInitState());

    final result = await removeWeatherOffline.execute();

    result.fold((failure) => emit(WeatherOfflineFailedState(message: failure.message)), (message) => {
      emit(WeatherOfflineSuccessState(message: message))
    });
  }

}