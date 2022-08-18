// ignore_for_file: prefer_const_constructors

import 'package:first_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool onChangedbtn = false;

  final _formKey = GlobalKey<FormState>();

  moveToHomePage(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        onChangedbtn = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, AppRoutes.HomeRoute);

      setState(() {
        onChangedbtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login Page'),
      // ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Image.asset('assets/images/animation_pic.gif',
                    width: 270, height: 270),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome $name !",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () => moveToHomePage(context),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: onChangedbtn ? 50 : 120,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.circular(onChangedbtn ? 50 : 8),
                        ),
                        child: onChangedbtn
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    )
                  ],
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/home');
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(11.0),
              //     child: Text(
              //       "Login",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, AppRoutes.HomeRoute);
      //   },
      //   child: const Icon(Icons.arrow_back_ios),
      // ),
    );
  }
}
