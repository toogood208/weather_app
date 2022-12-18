import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather_app/services/api_service.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/ui/view/home/home_view.dart';
import 'package:weather_app/ui/view/splash_screen/view/splash_screen2.dart';
import 'package:weather_app/ui/view/splash_screen/view/splash_screen_view.dart';
import 'package:weather_app/ui/view/weather/weather_view.dart';
import 'package:weather_app/ui/view/weather/weather_view_model.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: SplashScreenView),
    AdaptiveRoute(page: SplashScreen2View),
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: WeatherView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    Singleton(classType: WeatherViewModel),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: LocationService)
  ],
  logger: StackedLogger(),
)
class App {}
