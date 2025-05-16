import 'package:weather_app_bloc/data/weather_repository.dart';
import 'package:weather_app_bloc/logic/current_weather/current_weather_bloc.dart';
import 'package:weather_app_bloc/logic/weather_forecast/weather_forecast_bloc.dart';
import 'package:weather_app_bloc/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => CurrentWeatherBloc()..add(GetCurrentWeatherE()),
      ),
      BlocProvider(
        create: (context) => WeatherForecastBloc(WeatherRepository()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}