import 'package:flutter/material.dart';
import 'package:multi-book-app/multipages/show_page.dart';
import 'package:multi-book-app/pages/login_screen.dart';
import 'package:multi-book-app/pages/main_screen.dart';
import 'package:multi-book-app/pages/profileScreenCreator.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/services.dart';
import 'package:multi-book-app/pages/profileScreenCreator.dart';
import 'package:multi-book-app/themes.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await creatorPreferences.init();
}

class MyApp extends StatelessWidget {
  static final String title = 'Creator Profile';

  @override
  Widget build(BuildContext context) {
    final user = creatorPreferences.getCreator();

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          initialRoute: '/login',
    routes:{
      '/':(context)=>   MainScreen(),
      //       title'/login':(context)=>  LoginScreen(),
      '/profile':(context)=>  ProfilePage(),
      '/login':(context)=>  LoginScreen(),
      '/create':(context)=>  MainScreen(),
    }
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          title: title,
          //home: ProfilePage(),

        ),
      ),
    );
  }
}
