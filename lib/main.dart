import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/di/get_it.dart';
import 'package:weather_app/presentation/bloc/weather_cubit.dart';
import 'package:weather_app/presentation/screens/search_screen.dart';
import 'package:weather_app/presentation/screens/weather_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..fetchInitial(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        ),
        title: 'Weather app',
        home: const WeatherScreen(),
        routes: {
          SearchScreen.tag: (context) => const SearchScreen(),
        },
      ),
    );
  }
}
