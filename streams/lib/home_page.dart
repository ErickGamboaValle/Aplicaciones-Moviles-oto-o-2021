import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription<ConnectivityResult>? _subscription;
  String endPointUsers = "https://jsonplaceholder.typicode.com/users";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subscription =
        Connectivity().onConnectivityChanged.listen((connectivityResult) {
      // Got a new connectivity status!
      switch (connectivityResult) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
          connectivityAvailabable(true);
          break;
        case ConnectivityResult.none:
          connectivityAvailabable(false);
          break;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subscription?.cancel();
    super.dispose();
  }

//http GET
  Future getUserData() async {
    try {
      Response response = await get(Uri.parse(endPointUsers));
      if (response.statusCode == HttpStatus.ok) {
        var result = jsonDecode(response.body);
        return result;
      }
    } catch (e) {}
  }

  void connectivityAvailabable(bool conn) {
    if (conn) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text("Conectividad: $conn")),
        );
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text("No hay conectividad")),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streams'),
      ),
      body: FutureBuilder(
        future: getUserData(),
        builder: (context, AsyncSnapshot<dynamic> result) {
          if (result.hasData) {
            return ListView.builder(
                itemCount: (result.data as List).length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(result.data[index]["name"]),
                    subtitle: Text(result.data[index]["phone"]),
                  );
                });
          } else if (result.hasError) {
            return Center(child: Text("Has errpr"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
