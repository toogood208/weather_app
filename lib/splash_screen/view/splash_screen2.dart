
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/home/view/home_view.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/utils/colors_util.dart';
import 'package:weather_app/utils/dimension_utils.dart';
import 'package:weather_app/utils/text_styles.dart';

class SplashScreen2View extends StatefulWidget {
  const SplashScreen2View({super.key});

  @override
  State<SplashScreen2View> createState() => _SplashScreen2ViewState();
}

class _SplashScreen2ViewState extends State<SplashScreen2View> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashScreen2BackgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            right: 0,
            top: 0,
            width: splash2Iconwidth,
            height: splashScreen2IconHeight,
            child: Image.asset(
              'assets/images/star.png',
            ),
          ),
          Positioned(
            //<-- SEE HERE
            top: splashScreen2WeatherTextPositionTop,
            left: splashScreen2WeatherTestPositionLeft = 61.w,

            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: splashScreen2ButtonWeatherSizedBoxWidth,
                height: splashScreen2ButtonWeatherSizedBoxHeight,
                child: Text(
                  "Let’s See The ⭐ Weather Around you",
                  textAlign: TextAlign.left,
                  style:splashScreen2LetsWeatherTextStyle
                ),
              ),
            ),
          ),
          Positioned(
            //<-- SEE HERE
            top: splashScreen2ButtonPositionTop,
            left: splashScreen2ButtonPositionLeft,
            child: GestureDetector(
              onTap: () async {
                  var position = await LocationService().getGeoLocationPosition();
                  LocationService().getAddressFromLatLong(position).then((value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeView(city: value,)));     
       
      });
               
              },
              child: Container(
                width:splashScreen2ButtonWidth,
                height: splashScreen2ButtonHeight,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(12, 24, 35, 1),
                    borderRadius: BorderRadius.circular(splashScreen2ButtonRadius)),
                child: Center(
                  child: Text(
                    "Let’s check",
                    style:splashScreen2LetsCheckTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
