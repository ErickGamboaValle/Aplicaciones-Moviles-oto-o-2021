import 'package:cart/models/producto.dart';
import 'package:cart/models/productos.dart';
import 'package:cart/repositories/products_repository.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  int _total = 0;
  int get getTotal => _total;
  Map<String?, int> productos = {};
  List<Producto> _productoslist = [];
  List<Producto> get getProductosList => _productoslist;

  void addtoCart(Producto producto) {
    if (productos.containsKey(producto.idProduct)) {
      productos[producto.idProduct] = productos[producto.idProduct]! + 1;
    } else {
      productos[producto.idProduct] = 1;
      _productoslist.add(producto);
    }
    _total += producto.price!;
    notifyListeners();
  }

  void deleteFromCart(Producto producto) {
    if (!productos.containsKey(producto.idProduct)) {
      return;
    }
    if (productos[producto.idProduct] == 1) {
      productos.remove(producto.idProduct);
      _productoslist.remove(producto);
    } else {
      productos[producto.idProduct] = productos[producto.idProduct]! - 1;
    }
    _total -= producto.price!;
    notifyListeners();
  }
}
