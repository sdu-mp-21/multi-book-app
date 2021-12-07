
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi-book-app/pages/login.dart';
import 'package:multi-book-app/pages/signup.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(


          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 50),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: <Widget> [
              Column(

                children: <Widget> [
                  Text(
                    "Welcome to Multibook!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold, 
                      fontSize: 20, 
                      ),
                  ),

                  SizedBox(height: 30,),

                  Text(
                    "In this app you can find every book, then read, watch and listen it!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height /3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/undraw_welcome_cats_thqn.png")
                  )
                ),
              ), 
              Column(
                children: <Widget> [
                  MaterialButton(
                    minWidth: double.infinity,
                      height: 60,
                      onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white
                      ),
                    )
                  ),
                  
                  SizedBox(height: 30),
                  
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                    },
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Text("Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white
                      ),
                    ),
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
