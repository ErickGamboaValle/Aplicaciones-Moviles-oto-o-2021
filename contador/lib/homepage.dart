// ignore_for_file: prefer_const_constructors
import 'package:contador/contador.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
        backgroundColor: Colors.pink[100],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("contador de tiempo"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Consumer<Contador>(
                builder: (context, counter, child) {
                  return Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    color: Colors.pink[100],
                    child:
                        Text("${counter.count}", textAlign: TextAlign.center),
                  );
                },
              ),
              Consumer<Contador>(
                builder: (context, counter, child) {
                  return Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    color: Colors.pink[100],
                    child:
                        Text("${counter.count}", textAlign: TextAlign.center),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                mini: true,
                tooltip: "Sumar",
                backgroundColor: Colors.pink[100],
                child: Icon(Icons.add),
                onPressed: () {
                  context.read<Contador>().increment();
                },
              ),
              FloatingActionButton(
                mini: true,
                tooltip: "Restar",
                backgroundColor: Colors.pink[100],
                child: Icon(Icons.remove),
                onPressed: () {
                  context.read<Contador>().decrement();
                },
              ),
              FloatingActionButton(
                mini: true,
                tooltip: "Sumar",
                backgroundColor: Colors.pink[100],
                child: Icon(Icons.add),
                onPressed: () {
                  context.read<Contador>().increment();
                },
              ),
              FloatingActionButton(
                mini: true,
                tooltip: "Restar",
                backgroundColor: Colors.pink[100],
                child: Icon(Icons.remove),
                onPressed: () {
                  context.read<Contador>().decrement();
                },
              ),
            ],
          ),
          SizedBox(
            width: 20,
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[100],
                ),
                child: Text("Reiniciar"),
                onPressed: () {
                  context.read<Contador>().setToZero();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
