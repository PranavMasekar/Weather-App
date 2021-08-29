import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class HomePageofweatherapp extends StatefulWidget {
  @override
  _HomePageofweatherappState createState() => _HomePageofweatherappState();
}

class _HomePageofweatherappState extends State<HomePageofweatherapp> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("This is in it state");
  }

  @override
  Widget build(BuildContext context) {
    search.text = "";
    final info = (ModalRoute.of(context)!.settings.arguments as Map);

    var cityname = ["Mumbai", "Delhi", "Pune", "London", "Chennai", "Indore"];
    final _random = Random();
    var city = cityname[_random.nextInt(cityname.length)];
    String temp = ((info['temp_value']).toString()).substring(0, 4);
    String icon = info['icon_value'];
    String city1 = info['city_value'];
    String hum = info['hum_value'];
    String air = ((info['airspeed_value']).toString()).substring(0, 4);
    String des = info['des_value'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.lightBlue,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.lightBlueAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/loading",
                            arguments: {"city": search.text});
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: search,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search $city",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.all(30),
                      child: Row(
                        children: [
                          Image.network(
                              "http://openweathermap.org/img/wn/$icon@2x.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                "$des",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "In $city1",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(WeatherIcons.thermometer),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$temp",
                                style: TextStyle(fontSize: 70),
                              ),
                              Text(
                                "°C",
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.cloudy_windy),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "$air",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text("km/hr"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.humidity),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "$hum",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text("percent"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
