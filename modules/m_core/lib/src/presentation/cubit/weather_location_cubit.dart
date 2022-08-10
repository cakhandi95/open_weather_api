import 'package:m_core/m_core.dart';

///
/// Created by handy on 10/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

class WeatherLocationCubit extends Cubit<WeatherLocationState> {

  final GetWeatherLocation getWeatherLocation;

  WeatherLocationCubit({required this.getWeatherLocation}) : super(const WeatherLocationInitState());

  Future<void> get(String longitude, String latitude) async {
    emit(const WeatherLocationLoadingState());

    final result = await getWeatherLocation.execute(longitude, latitude);

    result.fold((failure) => emit(WeatherLocationErrorState(httpStatus: failure.httpStatus, message: failure.message)), (data) => {
      emit(WeatherLocationLoadedState(data))
    });
  }
}