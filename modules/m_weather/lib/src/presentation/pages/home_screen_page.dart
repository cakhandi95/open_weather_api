
import 'package:flutter/material.dart';
import 'package:m_core/m_core.dart';
import 'package:m_weather/m_weather.dart';
import  'package:m_core/src/utils/location.dart' as loc;


///
/// Created by Handy on 10/08/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class HomeScreenPage extends StatefulWidget {

  const HomeScreenPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {

  String backgroundName = Assets.backgroundScreen;
  late final ValueGetter<Future<void>> onRefresh;

  void changeBackgroundWeather(String values) {
    setState(() {
      backgroundName = values;
    });
  }

  @override
  void initState() {
    getLocationWeather();
    super.initState();
  }

  Future<void> getLocationWeather() async {
    loc.Location location = loc.Location();
    await location.getCurrentLocation();
    Future.microtask(() => {
      BlocProvider.of<WeatherLocationCubit>(context).get(location.longitude.toString(), location.latitude.toString())
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<WeatherLocationCubit,WeatherLocationState>(
        listener: (context, state) {
          if (state is WeatherLocationLoadedState) {
            var weatherTable = WeatherTable(
                id: state.weatherResponse.id,
                city: state.weatherResponse.name,
                latitude: state.weatherResponse.coord.lat.toString(),
                longitude: state.weatherResponse.coord.lon.toString(),
                temperature: state.weatherResponse.main.temp.toString(),
                description: state.weatherResponse.weather[0].description
            );
            Future.microtask(() => {
              BlocProvider.of<WeatherOfflineCubit>(context).remove(),
              BlocProvider.of<WeatherOfflineCubit>(context).insert(weatherTable)
            });
          }
        },
        builder: (context, state) {
          if (state is WeatherLocationLoadingState) {
            return const LoadingScreen();
          } else if (state is WeatherLocationLoadedState) {
            return Stack(
              children: [
                weatherBackground(),
                RefreshIndicator(
                    onRefresh: onRefresh,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      clipBehavior: Clip.none,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 48),
                            Lottie.asset(getWeatherIcon(state.weatherResponse.weather[0].id),width: 150,height: 150,fit: BoxFit.cover),
                            Text(
                              state.weatherResponse.name,
                              style: theme.textTheme.headline2?.copyWith(
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            Text(
                              '${state.weatherResponse.main.temp.toStringAsPrecision(2)}°',
                              style: theme.textTheme.headline3?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                )
              ],
            );
          } else if (state is WeatherCityErrorState) {
            return const ErrorScreen();
          } else {
            return Container();
          }
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget weatherBackground() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Lottie.asset(backgroundName, fit: BoxFit.cover),
    );
  }
}
