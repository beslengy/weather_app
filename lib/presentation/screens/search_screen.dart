import 'dart:async';
import 'dart:ffi';

import 'package:country_state_city/country_state_city.dart' as city;
import 'package:country_state_city/utils/city_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_app/domain/service/suggestions_service.dart';
import 'package:weather_app/presentation/bloc/weather_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const String tag = 'search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final suggestions = GetIt.I<SuggestionService>();

  void _clearFocus() => FocusScope.of(context).unfocus();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            TypeAheadField<city.City>(
              textFieldConfiguration: const TextFieldConfiguration(
                autofocus: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter city name"),
              ),
              suggestionsCallback: (pattern) async {
                if (pattern.isEmpty || pattern.length < 2) return [];
                return await suggestions.fetchSuggestions(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion.name),
                );
              },
              onSuggestionSelected: (suggestion) {
                if (suggestion.latitude != null &&
                    suggestion.longitude != null) {
                  try {
                    context.read<WeatherCubit>().fetchByParams(
                          LatLng(
                            double.parse(suggestion.latitude!),
                            double.parse(suggestion.longitude!),
                          ),
                        );
                    Navigator.of(context).pop();
                  } on Error catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.toString()),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.red.withOpacity(0.6),
                    ));
                  }
                }
              },
            )
          ]),
        ),
      ),
    );
  }
}
