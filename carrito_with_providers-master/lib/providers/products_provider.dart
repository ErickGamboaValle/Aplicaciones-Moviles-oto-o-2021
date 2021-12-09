import 'package:cart/models/productos.dart';
import 'package:cart/repositories/products_repository.dart';
import 'package:flutter/foundation.dart';

class ProductsProvider with ChangeNotifier {
  Productos? _productos;
  Productos? get getProductos => _productos;
  int? get getProductsSize => _productos?.productosList?.length;

  Future getAllProducts() async {
    _productos = await ProductosRepository().getProductos("productos");
    notifyListeners();
  }
}
