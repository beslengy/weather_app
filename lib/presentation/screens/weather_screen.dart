import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_cubit.dart';
import 'package:weather_app/presentation/screens/search_screen.dart';


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textStyle = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.of(context).pushNamed(SearchScreen.tag);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state.status == WeatherStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text("Error"),
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red.withOpacity(0.6),
            ));
          }
        },
        builder: (context, state) {
          if (state.status == WeatherStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.weather != null) {
            return SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // City name
                      Text(
                        state.weather!.region,
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),

                      // Temperature block
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Column(
                          children: [
                            Text(
                              "${state.weather!.temp}\u00B0C",
                              style: textStyle.displayLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Feels like: ${state.weather!.feelsLike}\u00B0C",
                              style: textStyle.bodyMedium,
                            )
                          ],
                        ),
                      ),

                      // Weather block
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: theme.colorScheme.surfaceVariant,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(state.weather!.imageLink)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.weather!.weather,
                                  style: textStyle.displaySmall,
                                ),
                                Text(
                                  state.weather!.weatherDetail,
                                  style: textStyle.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Additional info block
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // Wind
                            Row(
                              children: [
                                Text(
                                  "Wind: ",
                                  style: textStyle.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${state.weather!.windDirection} ${state.weather!.windSpeed} meters/sec",
                                  style: textStyle.bodyLarge!,
                                ),
                              ],

                            ),
                            const SizedBox(height: 16),
                            // Pressure
                            Row(
                              children: [
                                Text(
                                  "Atmospheric pressure: ",
                                  style: textStyle.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${state.weather!.pressure} mmhg",
                                  style: textStyle.bodyLarge!,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
