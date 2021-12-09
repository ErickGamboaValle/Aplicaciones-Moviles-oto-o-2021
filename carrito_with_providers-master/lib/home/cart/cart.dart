import 'package:cart/home/cart/item_cart.dart';
import 'package:cart/models/carrito.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrito"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ItemCart(
                  itemCart: null,
                );
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("TOTAL: 999"),
            ),
          ),
        ],
      ),
    );
  }
}
