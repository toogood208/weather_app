import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/app/app.logger.dart';
import 'package:weather_app/core/models/city_model.dart';
import 'package:weather_app/core/models/weather/weather.dart';

import '../core/constant/api_key_.dart';

class ApiService {
  Future<DataResponse> getWeather(String cityName) async {
    final log = getLogger("ApiService");
    try {
      var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
          {'q': cityName, "units": "metric", "appid": apiKey});
      final http.Response response = await http.get(url);
      log.d(response.body.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = json.decode(response.body);
        return DataResponse.fromJson(decodedJson);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception("Could not load data $e");
    }
  }

  Future<List<CityName>> getCityName(city) async {
    var response = await DefaultAssetBundle.of(city)
        .loadString("assets/data/city_data.json");
    log(response.toString());
    return cityNameFromJson(response);
  }
}
