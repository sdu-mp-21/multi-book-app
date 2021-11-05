import 'package:flutter/material.dart';
import 'package:multi-book-app/pages/login_screen.dart';
import 'package:multi-book-app/pages/main_screen.dart';
import 'package:multi-book-app/pages/profileScreenCreator.dart';

void main() {
  runApp( MaterialApp(
   

    initialRoute: '/login',
    routes:{
      '/':(context)=>   MainScreen(),
      //       title'/login':(context)=>  LoginScreen(),
      '/profile':(context)=>  creatorProfilePage(),
      '/login':(context)=>  LoginScreen(),
      '/create':(context)=>  MainScreen(),
      //something update
      // i add some file dasdasda
    },
  ));
}

  //runApp(MyApp());
//}

// class MyApp extends StatelessWidget {
//   static final String title = 'User Profile';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.blue.shade300,
//         dividerColor: Colors.black,
//       ),
//       title: title,
//       home: creatorProfilePage(),
//     );
//   }
// }
