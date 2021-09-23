import 'dart:convert';
import 'package:cripto_lists/data/constants.dart' as cData;
import 'package:flutter/material.dart';

class Exchanges extends StatelessWidget {
  final String cryptoExchanges = cData.CRYPTO_EXCHANGES;
  const Exchanges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var exchanges = jsonDecode(cryptoExchanges);
    return ListView.separated(
      separatorBuilder: (ctx, idx) => Divider(),
      itemCount: (exchanges as List).length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            child: Image.network("${exchanges[index]["image"]}"),
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            "${exchanges[index]["name"]}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "${exchanges[index]["country"]}\n${exchanges[index]["year_established"]}",
          ),
          trailing: CircleAvatar(
            child: Text("${exchanges[index]["trust_score"]}"),
          ),
        );
      },
    );
  }
}
