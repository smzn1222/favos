import 'package:favos/src/Entity/shop.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final Shop shop;

  ShopCard({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(shop.name),
        subtitle: Text(shop.url),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
