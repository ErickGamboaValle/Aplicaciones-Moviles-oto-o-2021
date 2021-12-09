// ignore_for_file: prefer_const_constructors

import 'package:cart/home/cart/cart.dart';
import 'package:cart/home/item_product.dart';
import 'package:cart/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de productos"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
            icon: Icon(Icons.shopping_cart_rounded),
            tooltip: "Carrito de compras",
          ),
        ],
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, prodsProv, child) {
          return ListView.builder(
            itemCount: prodsProv.getProductsSize,
            itemBuilder: (BuildContext context, int index) {
              return ItemProduct(
                itemProduct: prodsProv.getProductos?.productosList?[index],
              );
            },
          );
        },
      ),
    );
  }
}
