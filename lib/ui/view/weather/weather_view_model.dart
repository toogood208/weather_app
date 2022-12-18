import 'package:stacked/stacked.dart';
import 'package:weather_app/app/app.logger.dart';
import 'package:weather_app/core/models/weather/weather.dart';
import 'package:weather_app/services/api_service.dart';
import 'package:weather_app/ui/utils/managers/string_manager.dart';

class WeatherViewModel extends BaseViewModel {
   final log = getLogger("WeatherViewModel");
  final _apiService = ApiService();
  String temperature = "";
  String weatherIcon = "";
  String description = "";
 

  Future<void> getData(String cityName) async {
    setBusy(true);
    DataResponse dataResponse = await _apiService.getWeather(cityName);
    temperature = removeDecimal("${dataResponse.main!.temp}");
    description = dataResponse.weather![0].description!;
    weatherIcon =
        "http://openweathermap.org/img/w/${dataResponse.weather![0].icon}.png";

    notifyListeners();
    setBusy(false);
    log.d(dataResponse);
  }
}
