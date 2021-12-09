// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:cart/home/home_page.dart';
import 'package:cart/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider<ProductsProvider>(
        create: (context) => ProductsProvider()..getAllProducts(),
        child: HomePage(),
      ),
    );
  }
}
