import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:multi-book-app/model/authentication_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late AuthenticationService auth;

  @override
  void initState() {
    auth = AuthenticationService();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Color WarningColor = Colors.black;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome back !",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),

                // TextFormField(
                //         controller: _emailController,
                //         // validator: (val)=> val.isNotEmpty,
                //         decoration: InputDecoration(

                //           hintText: "Email",
                //           prefixIcon: Icon(Icons.mail),

                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10)
                //             )
                //         )
                //       ),

                //       TextFormField(
                //         controller: _passwordController,
                //         // validator: (val)=> val.isNotEmpty,
                //         decoration: InputDecoration(
                //           hintText: "Password",
                //           prefixIcon: Icon(Icons.vpn_key),
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10)
                //             )
                //         )
                //       ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      makeInput(
                        label: "Email",
                      ),
                      makeInput(label: "Password", obsureText: true),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black))),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        auth
                            .signIn(
                                _emailController.text, _passwordController.text)
                            .then((value) {
                          if (value != null) {
                            Navigator.popAndPushNamed(context, '/');
                          } else {
                            print('WARNING IS NOT WORK!!!!');
                            setState(() {
                              WarningColor = Colors.red;
                            }
                            );
                          }
                        }
                        );
                      },
                      color: WarningColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white70),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Dont have an account?"),
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget makeInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
      const SizedBox(
        height: 30,
      )
    ],
  );
}
