import 'package:flutter/material.dart';
import 'package:geeky_app/Weather%20App/home.dart';
import 'Weather App/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Landingpage(),
        "/home": (context) => HomePageofweatherapp(),
        "/loading": (context) => Landingpage(),
      },
      title: "Flutter",
    );
  }
}
