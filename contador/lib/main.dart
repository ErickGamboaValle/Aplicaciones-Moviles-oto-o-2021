// ignore_for_file: prefer_const_constructors

import 'package:contador/contador.dart';
import 'package:contador/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<Contador>(
        create: (context) => Contador(),
        child: HomePage(),
      ),
    );
  }
}
