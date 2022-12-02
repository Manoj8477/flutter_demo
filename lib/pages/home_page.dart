// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors

import 'package:demo_project/models/catalog.dart';
import 'package:demo_project/widgets/items_Widget.dart';
import 'package:demo_project/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final days = 30;

  //final dummulist = List.generate(50, (index) => CatalogModel.Items[0]);
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 5));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalogue.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];

    CatalogModel.Items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Catalog App",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: CatalogModel.Items.isNotEmpty
          ? ListView.builder(
              itemCount: CatalogModel.Items.length,
              itemBuilder: (context, index) {
                return ItemsWidget(item: CatalogModel.Items[index]);
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
    );
  }
}
