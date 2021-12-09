import 'package:equatable/equatable.dart';

class Producto extends Equatable {
	final String? idProduct;
	final String? picture;
	final String? name;
	final int? price;
	final String? description;
	final bool? favorite;
	final int? ranking;
	final int? amount;
	final int? id;

	const Producto({
		this.idProduct, 
		this.picture, 
		this.name, 
		this.price, 
		this.description, 
		this.favorite, 
		this.ranking, 
		this.amount, 
		this.id, 
	});

	factory Producto.fromJson(Map<String, dynamic> json) => Producto(
				idProduct: json['idProduct'] as String?,
				picture: json['picture'] as String?,
				name: json['name'] as String?,
				price: json['price'] as int?,
				description: json['description'] as String?,
				favorite: json['favorite'] as bool?,
				ranking: json['ranking'] as int?,
				amount: json['amount'] as int?,
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'idProduct': idProduct,
				'picture': picture,
				'name': name,
				'price': price,
				'description': description,
				'favorite': favorite,
				'ranking': ranking,
				'amount': amount,
				'id': id,
			};

		Producto copyWith({
		String? idProduct,
		String? picture,
		String? name,
		int? price,
		String? description,
		bool? favorite,
		int? ranking,
		int? amount,
		int? id,
	}) {
		return Producto(
			idProduct: idProduct ?? this.idProduct,
			picture: picture ?? this.picture,
			name: name ?? this.name,
			price: price ?? this.price,
			description: description ?? this.description,
			favorite: favorite ?? this.favorite,
			ranking: ranking ?? this.ranking,
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
				description,
				favorite,
				ranking,
				amount,
				id,
		];
	}
}
