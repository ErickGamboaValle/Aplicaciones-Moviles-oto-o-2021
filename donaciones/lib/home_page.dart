import 'package:donaciones/donativos.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  HhomepageState createState() => HhomepageState();
}

class HhomepageState extends State<Homepage> {
  double donacionesAcumuladas = 0.0;
  double Total = 10000;
  double progress = 0.0;
  int? currentradio;
  int? currentdropitem;
  double totalPaypal = 0;
  double totalTarjeta = 0;
  double acumulado = 0;
  var radiogroup = {
    0: "paypal",
    1: "Tarjeta",
  };
  var assetsgroup = {
    0: "assets/Paypal.png",
    1: "assets/Tarjeta.png",
  };

  var dropItemsGroup = {
    0: 100,
    1: 350,
    2: 850,
    3: 1050,
    4: 9999,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Homepage")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "Es para una buena causa",
              style: TextStyle(fontSize: 28),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: generate(),
              ),
            ),
            ListTile(
              title: Text("Cantidad a donar"),
              trailing: DropdownButton(
                items: dropdown(),
                value: currentdropitem,
                onChanged: (int? selected) {
                  currentdropitem = selected;
                  setState(() {});
                },
              ),
            ),
            LinearProgressIndicator(
              minHeight: 20,
              value: progress,
            ),
            MaterialButton(
              onPressed: () {
                calcularDonaciones();
                setState(() {});
              },
              child: Text("Donar"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.text_format),
          onPressed: () {
            //Navigator.of(context).push(
            // MaterialPageRoute(builder: (context) {
            //   return Donativos();
            // }),
            // );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Donativos(
                  donativos: {
                    "Paypal": totalPaypal,
                    "Tarjeta": totalTarjeta,
                    "Acumulado": donacionesAcumuladas,
                    "MetaCumplida": donacionesAcumuladas >= Total,
                  },
                ),
              ),
            );
          }),
    );
  }

  void calcularDonaciones() {
    if (currentradio == 0) {
      totalPaypal += currentdropitem ?? 0;
    } else {
      totalTarjeta += currentdropitem ?? 0;
    }
    donacionesAcumuladas = totalPaypal + totalTarjeta;
    progress = donacionesAcumuladas / Total * 100;
    progress = progress > 100 ? 100 : progress;
  }

  dropdown() {
    return dropItemsGroup.entries
        .map((drop) =>
            DropdownMenuItem(value: drop.value, child: Text("${drop.value}")))
        .toList();
  }

  generate() {
    return radiogroup.entries
        .map(
          (radioElement) => ListTile(
            leading: Image.asset(
              assetsgroup[radioElement.key]!,
              height: 64,
              width: 64,
            ),
            trailing: Radio(
              value: radioElement.key,
              groupValue: currentradio,
              onChanged: (int? selected) {
                currentradio = selected;
                setState(() {});
              },
            ),
            title: Text("${radioElement.value}"),
          ),
        )
        .toList();
  }
}
