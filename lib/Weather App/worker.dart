import 'dart:convert';

import 'package:http/http.dart';

class Worker {
  late String location;
  late String temp;
  late String humidity;
  late String air;
  late String description;
  late String main;
  late String icon;

  Worker({required this.location}) {
    location = this.location;
  }

  Future<void> getdata() async {
    try {
      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=04539b21dd53acd06ffb0d1d1003a04a");
      var response = await get(url);
      Map data = jsonDecode(response.body);

      Map tempData = data['main'];
      Map wind = data['wind'];
      double getairSpeed = wind['speed'] / 0.27;
      String gethumidity = tempData['humidity'].toString();
      double gettemp = tempData['temp'] - 273.15;

      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getmainDesc = weatherMainData['main'];
      String getdesc = weatherMainData['description'];

      temp = gettemp.toString();
      humidity = gethumidity;
      air = getairSpeed.toString();
      description = getdesc;
      main = getmainDesc;
      icon = weatherMainData['icon'];
    } catch (e) {
      temp = "Cant find data!!!";
      humidity = "Cant find data!!!";
      air = "Cant find data!!!";
      description = "Cant find data!!!";
      main = "Cant find data!!!";
      icon = "Cant find data!!!";
    }
  }
}
