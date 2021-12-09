import 'package:equatable/equatable.dart';

import 'producto.dart';

class Productos extends Equatable {
  final List<Producto>? productosList;

  const Productos({this.productosList});

  factory Productos.fromJson(Map<String, dynamic> json) => Productos(
        productosList: (json['productos'] as List<dynamic>?)
            ?.map((e) => Producto.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'productos': productosList?.map((e) => e.toJson()).toList(),
      };

  Productos copyWith({
    List<Producto>? productosList,
  }) {
    return Productos(
      productosList: productosList ?? this.productosList,
    );
  }

  @override
  List<Object?> get props => [productosList];
}
