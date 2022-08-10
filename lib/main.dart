import 'package:flutter/material.dart';
import 'package:m_core/m_core.dart';
import 'package:m_weather/m_weather.dart';
import 'package:provider/provider.dart';
import './injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          BlocProvider<WeatherLocationCubit>(
            create: (context) => di.locator<WeatherLocationCubit>(),
          ),
          BlocProvider<WeatherCityCubit>(
            create: (context) => di.locator<WeatherCityCubit>(),
          ),
          BlocProvider<WeatherOfflineCubit>(
            create: (context) => di.locator<WeatherOfflineCubit>(),
          ),
        ],
        child: MaterialApp(
          title: 'Open_Weather_Api',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreenPage(title: 'Weather API'),
        )
    );
  }
}
