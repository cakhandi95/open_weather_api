import 'package:m_core/m_core.dart';

///
/// Created by handy on 10/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

class WeatherCityCubit extends Cubit<WeatherCityState> {

  final GetWeatherCity getWeatherCity;

  WeatherCityCubit({required this.getWeatherCity}) : super(const WeatherCityInitState());

  Future<void> get(String city) async {
    emit(const WeatherCityLoadingState());

    final result = await getWeatherCity.execute(city);

    result.fold((failure) => emit(WeatherCityErrorState(httpStatus: failure.httpStatus, message: failure.message)), (data) => {
      emit(WeatherCityLoadedState(data))
    });

  }

}