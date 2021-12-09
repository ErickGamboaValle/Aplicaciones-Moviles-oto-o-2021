import 'package:cart/home/cart/item_cart.dart';
import 'package:cart/models/carrito.dart';
import 'package:cart/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Container(child: Consumer<CartProvider>(
        builder: (context, cartprovider, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartprovider.getProductosList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemCart(
                      itemCart: cartprovider.getProductosList[index],
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
                  child: Text(cartprovider.getTotal.toString()),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
