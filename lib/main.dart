import 'package:demo_project/core/store.dart';
import 'package:demo_project/pages/cart_page.dart';
import 'package:demo_project/pages/home_page.dart';
import 'package:demo_project/pages/login_page.dart';
import 'package:demo_project/util/routes.dart';
import 'package:demo_project/util/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.darkTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoute.homePage,
      routes: {
        MyRoute.homePage: (context) => const HomePage(),
        MyRoute.loginPage: (context) => const LoginPage(),
        MyRoute.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
