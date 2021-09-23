import 'dart:convert';

import 'package:cripto_lists/data/constants.dart';
import 'package:flutter/material.dart';

class Trending extends StatelessWidget {
  final String trending = CRYPTO_TRENDING;
  const Trending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var trending_map = jsonDecode(trending);
    return Scaffold(
      appBar: AppBar(
        title: Text("Trending"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                child: Image.network(
                    "${trending_map["coins"][index]["item"]["large"]}"),
              ),
              title: Text(
                "${trending_map["coins"][index]["item"]["id"]}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle:
                  Text("${trending_map["coins"][index]["item"]["price_btc"]}"),
              trailing: CircleAvatar(
                child: Text("${trending_map["coins"][index]["item"]["score"]}"),
                backgroundColor: Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}
