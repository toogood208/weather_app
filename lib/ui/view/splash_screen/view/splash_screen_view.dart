import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/ui/utils/colors_util.dart';
import 'package:weather_app/ui/utils/dimension_utils.dart';
import 'package:weather_app/ui/utils/text_styles.dart';
import 'package:weather_app/ui/view/splash_screen/view_model/splash_screen_view_model.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.navigateToSplashcreen2(),
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: splashScreenBackgroundColor,
        body: Center(
          child: Column(
            children: <Widget>[
              splashScreenCenterHeight,
              Image.asset(
                'assets/images/weather_splash_screen_icon.png',
                width: splashScreenIconWidth,
                height: splashScreenIconHeight,
              ),
              splashScreenIconToTextHeight,
              Text("weather X",
                  textAlign: TextAlign.center, style: splashScreenTextStyles),
            ],
          ),
        ),
      ),
    );
  }
}
