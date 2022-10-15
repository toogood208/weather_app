import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/splash_screen/view/splash_screen2.dart';
import 'package:weather_app/utils/colors_util.dart';
import 'package:weather_app/utils/dimension_utils.dart';
import 'package:weather_app/utils/text_styles.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
    ()=> Navigator.pushReplacement(context, 
    MaterialPageRoute(builder: (context) => const  SplashScreen2View())));
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: splashScreenBackgroundColor,
      body: Center(
        child: Column(     
          children: <Widget>[
           splashScreenCenterHeight,
            Image.asset('assets/images/weather_splash_screen_icon.png',
            width: splashScreenIconWidth,
            height: splashScreenIconHeight,),
            splashScreenIconToTextHeight,
            Text("weather X",
            textAlign: TextAlign.center, style: splashScreenTextStyles),         
          ],
        ),
      ),
    );
  }
}