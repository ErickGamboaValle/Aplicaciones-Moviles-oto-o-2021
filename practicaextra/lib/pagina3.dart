import 'package:flutter/material.dart';

class Pag3 extends StatefulWidget {
  Pag3({Key? key}) : super(key: key);

  @override
  _Pag3State createState() => _Pag3State();
}

class _Pag3State extends State<Pag3> {
  static String face = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página 3"),
        backgroundColor: Colors.pink[400],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /**********************Boton 1**********************/
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, '( ͡° ͜ʖ ͡°)');
              setState(() {});
            },
            child: Text('( ͡° ͜ʖ ͡°)'),
            style: ElevatedButton.styleFrom(
              primary: Colors.pink[200],
            ),
          ),
          /**********************Boton 2**********************/
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, '>_>');
              setState(() {});
            },
            child: Text('>_>'),
            style: ElevatedButton.styleFrom(
              primary: Colors.pink[200],
            ),
          ),
          /**********************Boton 3**********************/
          ElevatedButton(
            child: Text('UwU'),
            onPressed: () {
              Navigator.pop(context, 'UwU');
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.pink[200],
            ),
          ),
        ],
      ),
    );
  }
}
