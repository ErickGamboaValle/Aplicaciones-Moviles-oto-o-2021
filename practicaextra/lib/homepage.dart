// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practicaextra/pagina2.dart';
import 'package:practicaextra/pagina3.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var textController = TextEditingController();
  var resultado;
  var face;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarea 1'),
        backgroundColor: Colors.pink[400],
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
            Image.asset('assets/images/DashDart.png'),
            SizedBox(
              height: 40,
            ),
            const Text(
              'Seleccione la acción a realizar:',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /**********************Boton página 2**********************/
                ElevatedButton(
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Ingrese datos'),
                          content: TextField(
                            controller: textController,
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                                hintText: "Ingrese Palabra"),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Aceptar'),
                              onPressed: () async {
                                Navigator.of(context).pop();
                                resultado = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Pag2(),
                                  ),
                                );
                                setState(() {});
                              },
                            ),
                          ],
                        );
                      },
                    );
                    setState(() {});
                  },
                  child: const Text('Pagina 2'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[200],
                  ),
                ),
                /**********************Boton página 3**********************/
                ElevatedButton(
                  onPressed: () async {
                    face = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Pag3(),
                      ),
                    );

                    setState(() {});
                  },
                  child: const Text('Pagina 3'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[200],
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 50,
              height: 50,
            ),
            /**********************Textos de abajo**********************/
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Pag texto => ${textController.text}"),
                      SizedBox(width: 20, height: 50),
                      Text("Pag numero => ${resultado ?? ''}"),
                      SizedBox(width: 20, height: 50),
                      Text("Pag emote => ${face ?? ''}"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
