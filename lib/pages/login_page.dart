import 'package:demo_project/util/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        const SizedBox(
          height: 25.0,
        ),
        Image.asset(
          "assets/images/login_img.png",
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "Welcome $name",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter UserName", labelText: "UserName"),
                onChanged: (value) {
                  name = value;
                  setState(() {});
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter Password", labelText: "Password"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                child: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MyRoute.HomePage);
                },
                style: TextButton.styleFrom(minimumSize: Size(150, 30)),
              )
            ],
          ),
        )
      ],
    ));
  }
}
