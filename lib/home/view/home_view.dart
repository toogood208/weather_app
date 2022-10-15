import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/services/api_service.dart';
import 'package:weather_app/utils/colors_util.dart';
import 'package:weather_app/utils/dimension_utils.dart';

import '../../models/weather_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.city});
  final String city;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<WeatherModel> getData(String cityName) async {
    return await ApiService().getWeather(cityName);
  }

  Future<List<CityName>> getCities() async {
    return await ApiService().getCityName(context);
  }

  String dropdownvalue = 'New York ';

  @override
  void initState() {
    dropdownvalue = widget.city;
    getCities();
    setState(() {
      getData(dropdownvalue);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor:splashScreen2BackgroundColor,
          leading: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset("assets/images/profileImage.png",
                  width: homeLeadingImageWidth, height: homeLeadingImageHeight)),
          title: DropdownButtonHideUnderline(
            child: FutureBuilder(
                future: getCities(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.error != null) {
                      return Text("${snapshot.error}");
                    } else {
                      return DropdownButton<String>(
                        hint: Text(
                          dropdownvalue,
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp, color: Colors.black),
                        ),
                        items: snapshot.data!
                            .map<DropdownMenuItem<String>>((item) {
                          return DropdownMenuItem<String>(
                            value: item.name,
                            child: Text(
                              item.name,
                              style: GoogleFonts.poppins(
                                  fontSize: 14.sp, color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdownvalue = value!;

                            log(value);
                          });
                          getData(dropdownvalue);
                        },
                      );
                    }
                  }
                }),
          )
          ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
          left: 37.w,
        ),
        child: FutureBuilder<WeatherModel>(
            future: getData(dropdownvalue),
            builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.error != null) {
                  return const Text("erroor");
                } else {
                  String temp = snapshot.data!.temp;
                  var arr = temp.split('.');
                  return Stack(
                    children: <Widget>[
                      Positioned(
                        top: 58.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Feels Like A good ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromRGBO(9, 21, 30, 1)),
                                ),
                                Text(
                                  "time to ride a bike ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromRGBO(9, 21, 30, 1)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 25.h,
                                ),
                                Image.asset("assets/images/Vector.png"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 170.h,
                        child: Container(
                          padding: EdgeInsets.all(100.r),
                          width: 264.96.w,
                          height: 264.96.h,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(12, 24, 35, 1)),
                        ),
                      ),
                      Positioned(
                        top: 230.h,
                        left: 83.w,
                        child: Text(
                          "Today's Like",
                          style: GoogleFonts.poppins(
                              fontSize: 14.02.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                        ),
                      ),
                      Positioned(
                        top: 240.h,
                        left: 92.w,
                        child: Text(
                          "${arr[0]}°",
                          style: GoogleFonts.poppins(
                              fontSize: 43.89.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                        ),
                      ),
                      Positioned(
                        top: 260.h,
                        left: 118.w,
                        child: Image.asset(
                          "assets/images/sunny.png",
                          width: 84.w,
                          height: 85.h,
                        ),
                      ),
                      Positioned(
                        top: 280.h,
                        left: 215.w,
                        child: Image.asset(
                          "assets/images/Clear_night_icon_by_devoart.png",
                          width: 55.w,
                          height: 55.h,
                        ),
                      ),
                      Positioned(
                        top: 407.h,
                        left: 110.w,
                        child: Image.asset(
                          "assets/images/thundersrtom_icon_by_devoart.png",
                          width: 55.w,
                          height: 55.h,
                        ),
                      ),
                      Positioned(
                        top: 298.h,
                        left: 5.w,
                        child: Image.asset(
                          "assets/images/windy_icon_by_devoart.png",
                          width: 55.w,
                          height: 55.h,
                        ),
                      ),
                      Positioned(
                        top: 185.h,
                        left: 24.w,
                        child: Image.asset(
                          "assets/images/Cloudy_day_icon_by_devoart.png",
                          width: 55.w,
                          height: 55.h,
                        ),
                      ),
                      Positioned(
                        top: 184.h,
                        left: 185.w,
                        child: Image.asset(
                          "assets/images/rain_icon_by_devoart.png",
                          width: 55.w,
                          height: 55.h,
                        ),
                      ),
                      Positioned(
                        bottom: 60.h,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Today's Mood ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14.4.sp,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(54, 66, 77, 1)),
                                ),
                                Text(
                                  "Very Good ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromRGBO(12, 24, 35, 1)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tommorow's Mood ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14.4.sp,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(54, 66, 77, 1)),
                                ),
                                Text(
                                  "Excellent",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          const Color.fromRGBO(12, 24, 35, 1)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }
            }),
      )),
    );
  }
}
