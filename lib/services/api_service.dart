import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

import '../constant/api_key_.dart';

class ApiService {
  Future<WeatherModel> getWeather(String cityName) async {
    try {
      var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
          {'q': cityName, "units": "metric", "appid": apiKey});
      final http.Response response = await http.get(url);
      log(response.body.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = json.decode(response.body);
        return WeatherModel.fromMap(decodedJson);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception("Could not load data $e");
    }
  }

  Future<List<CityName>> getCityName(context) async {
    var response = await DefaultAssetBundle.of(context)
        .loadString("assets/data/city_data.json");
    log(response.toString());
    return cityNameFromJson(response);
  }
}
