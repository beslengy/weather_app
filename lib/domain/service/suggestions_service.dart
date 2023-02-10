import 'dart:async';

import 'package:country_state_city/country_state_city.dart';

class SuggestionService {
  static List<City> suggestions = [];

  init() async {
    var am = await getCountryCities("AM");
    var ru = await getCountryCities("RU");
    var tr = await getCountryCities("TR");
    suggestions = [...am, ...ru, ...tr];
    suggestions.sort((city1, city2) => city1.name.compareTo(city2.name));
    // suggestions = await getAllCities();
  }

  FutureOr<Iterable<City>> fetchSuggestions(String text) async {
    result() async {
      return suggestions
          .where((element) => element.name.toLowerCase().startsWith(text.toLowerCase()));
    }
    var res = await result();
    return res;
  }
}