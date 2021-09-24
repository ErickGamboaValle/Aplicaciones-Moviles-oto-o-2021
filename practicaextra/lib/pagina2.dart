// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:practicaextra/homepage.dart';

class Pag2 extends StatefulWidget {
  const Pag2({Key? key}) : super(key: key);

  @override
  Pag2State createState() => Pag2State();
}

/**********************Funcion generar numeros random**********************/
int generateRandomNumber() {
  var random = new Random();
  return (random.nextInt(1000));
}

class Pag2State extends State<Pag2> {
  static int numero = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 2'),
        backgroundColor: Colors.pink[400],
      ),
      body: Center(
        /**********************Estilo degradado**********************/
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.pink,
                Colors.white,
              ],
            ),
          ),
          /**********************Texto generar y numero generado**********************/
          child: Center(
              child: Column(
            children: [
              const Text(
                "Genere número random",
                style: TextStyle(color: Colors.amber, fontSize: 25),
              ),
              Text(
                "$numero",
                style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              /**********************Boton de generar**********************/
              ElevatedButton(
                onPressed: () => {
                  numero = generateRandomNumber(),
                  setState(() {}),
                },
                child: Text('Generar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[200],
                ),
              ),
              /**********************Boton guardar**********************/
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  Navigator.pop(context, numero);
                },
                child: Text("Guardar"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[200],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
