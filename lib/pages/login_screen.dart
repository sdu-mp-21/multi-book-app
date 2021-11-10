import 'dart:html';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _password = 'Password';
  String setinPassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 0),
                  alignment: Alignment.center,
                  child: const Text(
                    "Welcome to MultiApp",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const TextField(
                      decoration: InputDecoration(
                    labelText: 'Login',
                  )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: _password,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 15),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/');
                          },
                          child: const Text('Login')),
                    ),
                    Container(
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text('Sign Up')),
                        margin: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 15)),
                  ],
                ),
                Container(
                  color: Colors.blue,
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  

}
