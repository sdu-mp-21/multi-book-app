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
