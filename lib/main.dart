import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/multipages/show_page.dart';
import 'package:multi-book-app/pages/login.dart';
import 'dart:io';

import 'package:multi-book-app/pages/main_screen.dart';
// import 'package:multi-book-app/pages/profileScreenCreator.dart';
// import 'package:multi-book-app/pages/profileScreenUsers.dart';
import 'package:multi-book-app/pages/profile_screen_creator.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/services.dart';
import 'package:multi-book-app/pages/profile_screen_users.dart';
import 'package:multi-book-app/pages/search.dart';
import 'package:multi-book-app/pages/welcome.dart';

import 'package:multi-book-app/themes.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';
import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/utils/users_preferences.dart';

var users;
var creators;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await CreatorPreferences.init();
  await UsersPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    creators = CreatorPreferences.getCreator();
    users = UsersPreferences.getUsers();

    return ThemeProvider(
      initTheme: users.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => MainScreen(),
            '/profile': (context) => ProfilePage(),
            '/welcome': (context) => WelcomeScreen(),
            '/create': (context) => MainScreen(),
            '/search':(context)=> SearchPage(),
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          title: 'Multi Book',
        ),
      ),
    );
  }
}


//void main() {
//  runApp(MyApp());
//}
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text(
//            "aaaaaaaaaaa ",
//            style: TextStyle(fontSize: 18.0),
//          ),
//        ),
//        backgroundColor: Colors.blue[300],
//        body: SafeArea(
//          child: Center(
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                CircleAvatar(
//                  radius: 80,
//                  backgroundImage: AssetImage('images/protocoder.png'),
//                ),
//                Text(
//                  'Proto Coders Point',
//                  style: TextStyle(
//                    fontFamily: 'SourceSansPro',
//                    fontSize: 25,
//                  ),
//                ),
//                Text(
//                  'Welcome',
//                  style: TextStyle(
//                    fontSize: 20,
//                    fontFamily: 'SourceSansPro',
//                    color: Colors.red[400],
//                    letterSpacing: 2.5,
//                  ),
//                ),
//                SizedBox(
//                  height: 20.0,
//                  width: 200,
//                  child: Divider(
//                    color: Colors.teal[100],
//                  ),
//                ),
//                Text("xxxxxxxxxxxxxxxxx"),
//                Card(
//                    color: Colors.white,
//                    margin:
//                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                    child: ListTile(
//                      leading: Icon(
//                        Icons.phone,
//                        color: Colors.teal[900],
//                      ),
//                      title: Text(
//                        'github',
//                        style:
//                        TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
//                      ),
//                    )),
//                Card(
//                  color: Colors.white,
//                  margin:
//                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                  child: ListTile(
//                    leading: Icon(
//                      IconData(61042,fontFamily: 'MaterialIcons'),
//                      color: Colors.teal[900],
//                    ),
//                    title: Text(
//                      '190000000@stu.sdu.edu.kz',
//                      style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
