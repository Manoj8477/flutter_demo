// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:demo_project/pages/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final days = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of Flutter"),
        ),
      ),
      drawer:  MyDrawer(),
    );
  }
}
