import 'package:equatable/equatable.dart';

import 'carrito.dart';

class CartData extends Equatable {
  final List<CarritoElement>? carrito;

  const CartData({this.carrito});

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        carrito: (json['carrito'] as List<dynamic>?)
            ?.map((e) => CarritoElement.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'carrito': carrito?.map((e) => e.toJson()).toList(),
      };

  CartData copyWith({
    List<CarritoElement>? carrito,
  }) {
    return CartData(
      carrito: carrito ?? this.carrito,
    );
  }

  @override
  List<Object?> get props => [carrito];
}
