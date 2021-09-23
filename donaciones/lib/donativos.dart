import 'package:flutter/material.dart';

class Donativos extends StatefulWidget {
  final donativos;
  Donativos({Key? key, @required this.donativos}) : super(key: key);

  @override
  _DonativosState createState() => _DonativosState();
}

class _DonativosState extends State<Donativos> {
  @override
  Widget build(BuildContext context) {
    print("Donativos obtenidos: ${widget.donativos}");
    return Scaffold(
      appBar: AppBar(title: Text("Donativos Obtenidos")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                "assets/Paypal.png",
                height: 84,
                width: 84,
              ),
              trailing: Text("${widget.donativos}"),
            ),
            ListTile(
              leading: Image.asset(
                "assets/Tarjeta.png",
                height: 84,
                width: 84,
              ),
              trailing: Text("Tarjeta"),
            ),
            SizedBox(
              height: 24,
            ),
            Divider(),
            ListTile(
              trailing: Text("800.00"),
            )
          ],
        ),
      ),
    );
  }
}
