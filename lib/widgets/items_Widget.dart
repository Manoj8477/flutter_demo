// ignore_for_file: prefer_const_constructors

import 'package:demo_project/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  final Item item;

  const ItemsWidget({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$ ${item.price}",
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
