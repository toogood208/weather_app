import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/ui/view/home/home_view_model.dart';
import 'package:weather_app/ui/view/weather/weather_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
       viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: getViewForIndex(model.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.grey[800],
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            items:const [
               BottomNavigationBarItem(
              label: 'Posts',
              icon: Icon(Icons.art_track),
            ),
              
              BottomNavigationBarItem(
              label: 'Posts',
              icon: Icon(Icons.art_track),
            ),
              
              BottomNavigationBarItem(
              label: 'Posts',
              icon: Icon(Icons.art_track),
            ),
            BottomNavigationBarItem(
              label: 'Todos',
              icon: Icon(Icons.list),
            ),
            ],
          ),
        );
      },
    );
  }
}

 Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const WeatherView(city: 'Lagos',);
      case 1:
        return const Center(child: Text("second view"),);
       case 2:
        return const Center(child: Text("Third view"),);
       case 3:
        return const Center(child: Text("Fouth view"),);
      default:
        return const WeatherView(city: 'Lagos',);
    }
}

