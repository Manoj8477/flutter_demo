

import 'package:demo_project/util/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  final _formkey = GlobalKey<FormState>();
  bool changebutton = false;

  moveToHome(BuildContext context) async {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    setState(() {
      changebutton = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoute.homePage);
    setState(() {
      changebutton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formkey,
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
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter UserName", labelText: "UserName"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "UserName Can not be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password Can not be empty";
                      }
                      if (value.length < 4) {
                        return "Password length greater than 4 char";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changebutton ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: 50,
                        width: changebutton ? 50 : 150,
                        alignment: Alignment.center,
                        child: changebutton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                        // decoration: BoxDecoration(
                        //   color: Colors.deepPurpleAccent,
                        //   shape:
                        //       changebutton ? BoxShape.circle : BoxShape.rectangle,
                        //   // borderRadius: BorderRadius.circular(8)
                        // )),
                      ),
                    ),

                    // ElevatedButton(
                    //   child: Text(
                    //     "Login",
                    //     style: TextStyle(fontWeight: FontWeight.bold),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoute.HomePage);
                    //   },
                    //   style: TextButton.styleFrom(minimumSize: Size(150, 30)),
                    // )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
