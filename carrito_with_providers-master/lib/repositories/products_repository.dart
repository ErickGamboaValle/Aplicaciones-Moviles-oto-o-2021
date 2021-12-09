// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:cart/models/cart_data.dart';
import 'package:cart/models/productos.dart';
import 'package:http/http.dart';

class ProductosRepository {
  // singleton
  static final ProductosRepository _ProductosRepository =
      ProductosRepository._internal();
  factory ProductosRepository() {
    return _ProductosRepository;
  }

  ProductosRepository._internal();
  final String baseUrl =
      "https://api.sheety.co/567355b48b16449d68593f7d9deefa4c/productosData/";

  // productos fuente de datos
  Future<Productos?> getProductos(String resource) async {
    try {
      Response response = await get(Uri.parse(baseUrl + resource));
      if (response.statusCode == HttpStatus.ok) {
        Productos products =
            Productos.fromJson(await jsonDecode(response.body));
        return products;
      } else {
        return null;
      }
    } on Exception catch (ex, stackTrace) {
      print("ERROR: $resource>> ${ex.toString()}\n${stackTrace.toString()}");
      return null;
    }
  }

  // productos en carrito
  Future<CartData?> getCarrito(String resource) async {
    try {
      Response response = await get(Uri.parse(baseUrl + resource));
      if (response.statusCode == HttpStatus.ok) {
        CartData cartData = CartData.fromJson(await jsonDecode(response.body));
        return cartData;
      } else {
        return null;
      }
    } on Exception catch (ex, stackTrace) {
      print("ERROR: $resource>> ${ex.toString()}\n${stackTrace.toString()}");
      return null;
    }
  }

  // productos en carrito
  Future<String> saveCarrito(String resource, CartData cartData) async {
    try {
      Response response = await post(
        Uri.parse(baseUrl + resource),
        body: {
          cartData.toJson(),
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        return "Se ha guardado el producto correctamente";
      } else {
        return "Ha ocurrido un error al guardar el producto: ${response.statusCode}";
      }
    } on Exception catch (ex, stackTrace) {
      print("ERROR: $resource>> ${ex.toString()}\n${stackTrace.toString()}");
      return "Ha ocurrido un error desconocido";
    }
  }

  // productos en carrito
  Future<String> removeCarrito(String resource, String prodId) async {
    try {
      Response response = await delete(
        Uri.parse("$baseUrl$resource/$prodId"),
      );
      if (response.statusCode == HttpStatus.ok) {
        return "Se ha guardado el producto correctamente";
      } else {
        return "Ha ocurrido un error al guardar el producto: ${response.statusCode}";
      }
    } on Exception catch (ex, stackTrace) {
      print("ERROR: $resource>> ${ex.toString()}\n${stackTrace.toString()}");
      return "Ha ocurrido un error desconocido";
    }
  }
}
