import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_auth_example/circular_action.dart';
import 'package:local_auth_example/cuenta_item.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? selectedImage;

  Future _captureAndShare() async {
    // TODO: completar metodo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: "Compartir pantalla",
            onPressed: () async {
              await _captureAndShare();
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: (selectedImage != null
                    ? FileImage(selectedImage!)
                    : NetworkImage(
                        "https://www.nicepng.com/png/detail/413-4138963_unknown-person-unknown-person-png.png",
                      )) as ImageProvider<Object>?,
                minRadius: 40,
                maxRadius: 80,
              ),
              SizedBox(height: 16),
              Text(
                "Bienvenido",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black),
              ),
              SizedBox(height: 8),
              Text("Usuario${UniqueKey()}"),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularAction(
                    textAction: "Ver tarjeta",
                    iconData: Icons.credit_card,
                    bgColor: Color(0xff123b5e),
                    action: () {
                      // TODO: agregar evento
                    },
                  ),
                  CircularAction(
                    textAction: "Cambiar foto",
                    iconData: Icons.camera_alt,
                    bgColor: Colors.orange,
                    action: () {
                      // TODO: agregar evento
                    },
                  ),
                  CircularAction(
                    textAction: "Ver tutorial",
                    iconData: Icons.play_arrow,
                    bgColor: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 48),
              CuentaItem(),
              CuentaItem(),
              CuentaItem(),
            ],
          ),
        ),
      ),
    );
  }
}
