import 'package:flutter/material.dart';
import 'dart:io';

import 'package:multi-book-app/pages/login_screen.dart';
import 'package:multi-book-app/pages/main_screen.dart';
import 'package:multi-book-app/pages/profileScreenCreator.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/services.dart';

import 'package:multi-book-app/themes.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';

Future main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await creatorPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Creator Profile';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = creatorPreferences.getCreator();

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          initialRoute: '/login',
          routes: {
            '/': (context) => MainScreen(),
            //       title'/login':(context)=>  LoginScreen(),
            '/profile': (context) => ProfilePage(),
            '/login': (context) => LoginScreen(),
            '/create': (context) => MainScreen(),
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          title: title,
          //home: ProfilePage(),
        ),
      ),
    );
  }
}
