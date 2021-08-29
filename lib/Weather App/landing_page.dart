import 'package:flutter/material.dart';
import 'package:geeky_app/Weather%20App/worker.dart';

class Landingpage extends StatefulWidget {
  @override
  _LandingpageState createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  late String city = "pune";
  late String temp;
  late String hum;
  late String airspeed;
  late String des;
  late String main;
  late String icon;
  void call(String city) async {
    Worker instance = Worker(location: city);
    await instance.getdata();
    temp = instance.temp;
    hum = instance.humidity;
    airspeed = instance.air;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        'temp_value': temp,
        'hum_value': hum,
        'airspeed_value': airspeed,
        'des_value': des,
        'main_value': main,
        "icon_value": icon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final args = (ModalRoute.of(context)!.settings.arguments as Map);
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <dynamic, dynamic>{}) as Map;
    final cityRecived = args['city'] ?? "";

    if (cityRecived != "") {
      city = cityRecived;
    }
    call(city);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/mlogo.png", height: 240, width: 240),
            Text(
              "Weather App",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Made by Pranav",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
