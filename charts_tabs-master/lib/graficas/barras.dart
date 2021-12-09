import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Barras extends StatefulWidget {
  Barras({Key? key}) : super(key: key);

  @override
  _BarrasState createState() => _BarrasState();
}

class _BarrasState extends State<Barras> {
  List<BarChartGroupData>? _barSpots0;

  @override
  void initState() {
    _barSpots0 = [];
    for (int i = 0; i < datos.length; i++) {
      _barSpots0?.add(
        BarChartGroupData(
          barsSpace: 4,
          x: i,
          barRods: [
            BarChartRodData(
              colors: [Colors.yellow],
              y: datos[i]["cantidad"].toDouble(),
            ),
          ],
        ),
      );
    }

    super.initState();
  }

  // estilos y comportamientos de la grafica
  @override
  Widget build(BuildContext context) {
    final _barChartData = BarChartData(
        backgroundColor: Colors.grey[600],
        maxY: 10,
        gridData: FlGridData(show: true),
        axisTitleData: FlAxisTitleData(
          show: true,
          topTitle: AxisTitle(titleText: "Cantidad de productos"),
          leftTitle: AxisTitle(titleText: "Cantidad"),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (index) => datos[index.toInt()]["producto"],
          ),
        ),
        barGroups: _barSpots0);
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Text("Grafica de lineas"),
          SizedBox(height: 64),
          Expanded(
            child: BarChart(_barChartData),
          ),
        ],
      ),
    );
  }
}
