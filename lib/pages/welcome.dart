
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(
                    "Welcome to Multibook!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),

                  SizedBox(height: 30,),

                  Text("In this app you can find every book, then read, watch and listen it!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15
                    ),
                  ),

                  SizedBox(height: 30,),

                  Container(
                    height: MediaQuery.of(context).size.height/4,
                    child: Image(
                      image: NetworkImage('https://uxwing.com/wp-content/themes/uxwing/download/18-education-school/read-book.png'),
                    ),
                  ),

                  SizedBox(height: 30,),

                  MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: (){

                      },
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: Text("Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white
                      ),
                    )
                  ),

                  SizedBox(height: 30,),

                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){

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
              ),

            ],
          ),
        ),
      ),
    );
  }
}
