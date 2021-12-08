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
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          title: 'Multi Book',
        ),
      ),
    );
  }
}
