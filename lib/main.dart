import 'package:flutter/material.dart';

import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/multipages/show_page.dart';
import 'package:multi-book-app/pages/login.dart';
import 'dart:io';

import 'package:multi-book-app/pages/login_screen.dart';
import 'package:multi-book-app/pages/main_screen.dart';
// import 'package:multi-book-app/pages/profileScreenCreator.dart';
// import 'package:multi-book-app/pages/profileScreenUsers.dart';
import 'package:multi-book-app/pages/profile_screen_creator.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/services.dart';
import 'package:multi-book-app/pages/profile_screen_users.dart';
import 'package:multi-book-app/pages/welcome.dart';

import 'package:multi-book-app/themes.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';
import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/utils/users_preferences.dart';



// var users ;
// var creators;
// Future main()  async{
//
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   await CreatorPreferences.init();
//   await UsersPreferences.init();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   static const String title = 'Profile Page';
//
//   const MyApp({Key? key}) : super(key: key);
//
//
//   await creatorPreferences.init();
//   runApp(MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     creators = CreatorPreferences.getCreator();
//     users = UsersPreferences.getUsers();
//
//     return ThemeProvider(
//       initTheme:
//       users.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
//       child: Builder(
//         builder: (context) => MaterialApp(
//
//
//           initialRoute: '/login',
//
//     routes:{
//       '/':(context)=>   MainScreen(),
//       //       title'/login':(context)=>  LoginScreen(),
//       '/profile':(context)=>  ProfilePage(),
//       '/login':(context)=>  LoginScreen(),
//       '/create':(context)=>  MainScreen(),
//       //'/users' :(context)=> ProfilePage(),
//     },
//
//           initialRoute: '/welcome',
//
//           routes: {
//             '/': (context) => MainScreen(),
//             '/profile': (context) => ProfilePage(),
//             '/welcome': (context) => WelcomeScreen(),
//             '/create': (context) => MainScreen(),
//
//           },
//
//           debugShowCheckedModeBanner: false,
//           theme: ThemeProvider.of(context),
//           title: 'Multi Book',
//
//         ),
//       ),
//     );
//   }
// }




