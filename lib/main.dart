import 'package:flutter/material.dart';
import 'Recipe app/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: Home(),
    );
  }
}
