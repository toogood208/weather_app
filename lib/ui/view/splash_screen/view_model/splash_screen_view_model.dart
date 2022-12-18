import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather_app/app/app.locator.dart';
import 'package:weather_app/app/app.router.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToSplashcreen2() {
    Timer(
      const Duration(seconds: 3),
      () =>
          _navigationService.pushNamedAndRemoveUntil(Routes.splashScreen2View),
    );
  }

  navigateToHomeView() {
    _navigationService.navigateTo(Routes.homeView);
  }

}
