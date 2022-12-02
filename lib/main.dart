// ignore_for_file: use_key_in_widget_constructors

import 'package:demo_project/pages/home_page.dart';
import 'package:demo_project/pages/login_page.dart';
import 'package:demo_project/util/routes.dart';
import 'package:demo_project/util/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: MyRoute.homePage,
      routes: {
        MyRoute.homePage: (context) => HomePage(),
        MyRoute.loginPage: (context) => LoginPage(),
      },
    );
  }
}
