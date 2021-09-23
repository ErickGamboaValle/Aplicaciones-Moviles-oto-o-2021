import 'package:cripto_lists/exchanges.dart';
import 'package:cripto_lists/trending.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto APP"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text("Trending"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => Trending(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text("Exchange rates"),
            ),
          ],
        ),
      ),
      body: Exchanges(),
    );
  }
}
