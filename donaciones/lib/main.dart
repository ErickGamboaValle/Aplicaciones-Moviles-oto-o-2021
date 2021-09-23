import 'package:donaciones/donativos.dart';
import 'package:donaciones/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage());
    // initialRoute: "/homePage",
    //routes: {
    // "/homePage": (context) => Homepage(),
    //"/donatiovs": (context) => Donativos(),
    //});
  }
}
