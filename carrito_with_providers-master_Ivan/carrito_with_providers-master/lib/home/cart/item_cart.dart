import 'package:cart/models/carrito.dart';
import 'package:cart/models/producto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ItemCart extends StatelessWidget {
  final Producto? itemCart;
  const ItemCart({
    Key? key,
    @required this.itemCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5)),
                  child: Image.network(
                    itemCart!.picture.toString(),
                    width: 120,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {},
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.1),
                      ),
                      child: Text(itemCart!.amount.toString()),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemCart!.name.toString(),
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  itemCart!.price.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
