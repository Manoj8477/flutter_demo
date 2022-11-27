import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
        const Text(
          "Welcome",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter Password", labelText: "Password"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  print("Hii");
                },
                style: TextButton.styleFrom(),
              )
            ],
          ),
        )
      ],
    ));
  }
}
