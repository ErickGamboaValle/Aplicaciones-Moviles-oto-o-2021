import 'package:equatable/equatable.dart';

class CarritoElement extends Equatable {
  final String? idProduct;
  final String? picture;
  final String? name;
  final int? price;
  final int? amount;
  final int? id;

  const CarritoElement({
    this.idProduct,
    this.picture,
    this.name,
    this.price,
    this.amount,
    this.id,
  });

  factory CarritoElement.fromJson(Map<String, dynamic> json) => CarritoElement(
        idProduct: json['idProduct'] as String?,
        picture: json['picture'] as String?,
        name: json['name'] as String?,
        price: json['price'] as int?,
        amount: json['amount'] as int?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'idProduct': idProduct,
        'picture': picture,
        'name': name,
        'price': price,
        'amount': amount,
        'id': id,
      };

  CarritoElement copyWith({
    String? idProduct,
    String? picture,
    String? name,
    int? price,
    int? amount,
    int? id,
  }) {
    return CarritoElement(
      idProduct: idProduct ?? this.idProduct,
      picture: picture ?? this.picture,
      name: name ?? this.name,
      price: price ?? this.price,
      amount: amount ?? this.amount,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props {
    return [
      idProduct,
      picture,
      name,
      price,
      amount,
      id,
    ];
  }
}
