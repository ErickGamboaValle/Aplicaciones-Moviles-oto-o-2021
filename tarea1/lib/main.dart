import 'package:flutter/material.dart';

void main() => runApp(MyAppIteso());

class MyAppIteso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

int _contador = 0;

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void increment() {
    setState(() {
      _contador++;
    });
  }

  void decrement() {
    setState(() {
      _contador--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App Iteso Bar'),
      ),
      body: ListView(
        children: [
          //img
          Image.network(
            "https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg",
          ),
          Container(
            height: 10,
          ),
          //Row iteso + like button
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Iteso Universidad Jesuita de Guadajara",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "San Pedro Tlaquepaque",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              //DisLike
              IconButton(
                onPressed: () {
                  print("contador negativo " + _contador.toString());
                  decrement();
                },
                icon: Icon(Icons.thumb_down_outlined),
                color: Colors.indigo,
              ),

              //Like
              IconButton(
                onPressed: () {
                  print("contador positivo " + _contador.toString());
                  increment();
                },
                icon: Icon(Icons.thumb_up_outlined),
                color: Colors.indigo,
              ),
              Text('$_contador'),
            ],
          ),
          //Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Email button
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Email")));
                    },
                    icon: Icon(
                      Icons.mail,
                      size: 60,
                    ),
                  )
                ],
              ),
              //Call button
              Column(children: [
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Call")));
                  },
                  icon: Icon(
                    Icons.call,
                    size: 60,
                  ),
                )
              ]),
              //Directions button
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Directions")));
                    },
                    icon: Icon(
                      Icons.directions,
                      size: 60,
                    ),
                  )
                ],
              ),
            ],
          ),

          Container(
            height: 50,
          ),
          Text(
            "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara.",
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
