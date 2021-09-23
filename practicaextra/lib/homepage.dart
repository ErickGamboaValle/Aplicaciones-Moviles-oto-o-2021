// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarea 1'),
      ),
      body: Center(
        child: ListView(
          children: [
            Text(
              'Bienvenidos',
              textAlign: TextAlign.center,
              style: GoogleFonts.pacifico(
                fontSize: 40,
              ),
            ),
            Container(
              height: 10,
            ),
            Image.network(
                'https://raw.githubusercontent.com/kevmoo/dart_side/master/Dash%20Dart%20PNG%20%20-%20white.png'),
            Container(
              height: 40,
            ),
            const Text(
              'Seleccione la acción a realizar:',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text('Pagina 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text('Pagina 3'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
