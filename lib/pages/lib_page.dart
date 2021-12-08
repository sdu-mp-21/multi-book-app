import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: ListView(
//           children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(left: 25 , top: 25),
//                 child: Column(
//                   children: <Widget>[
//                     Text ('Hi' , style:TextStyle (
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black
//                     )
//                     ),
//                     Text ('Discover latest book' , style:TextStyle (
//                         fontSize: 22,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black
//                     )
//                     ),
//                   ],
//                 ),
//               ),
//
//             Container(
//               height: 30,
//               margin: EdgeInsets.only(left: 25 , right: 25 , top: 18),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.black12
//               ),
//               child: Stack(
//                 children: <Widget>[
//                   TextField(
//                     maxLengthEnforced: true,
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     decoration:InputDecoration(
//                       contentPadding: EdgeInsets.only(left: 19,right: 50 , bottom: 17),
//                           border: InputBorder.none,
//                       hintText: 'Search book..',
//                       hintStyle: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey,
//                         fontWeight: FontWeight.w600
//                       )
//                     ) ,
//                   ),
//                    Positioned(
//                        top: 4,
//                        right: 9,
//                        child: Icon(Icons.search))
//                 ],
//               ),
//             ),
//             Container(
//               height: 25,
//               margin: EdgeInsets.only(top: 30),
//               padding: EdgeInsets.only(left: 25),
//               child: DefaultTabController(
//                 length: 3,
//                 child: TabBar(
//                   labelPadding: EdgeInsets.all(0),
//                   indicatorPadding: EdgeInsets.all(0),
//                   isScrollable: true,
//                   labelColor: Colors.black,
//                   unselectedLabelColor: Colors.black12,
//                   labelStyle: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700
//                   ) ,
//                   unselectedLabelStyle: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600
//                   ),
//                   /* indicator: RoundedRectangleBorder(
//                       weight: 2,
//                       width : 10 ,
//                       color : Colors.black12
//                         ),*/
//                   tabs: [
//                     Tab(
//                       child: Container(
//                         margin : EdgeInsets.only(right: 23),
//                        child: Text('Audio'),
//                       ),
//                     ),
//                     Tab(
//                       child: Container(
//                         margin : EdgeInsets.only(right: 23),
//                         child: Text('Video'),
//                       ),
//                     ),
//                     Tab(
//                       child: Container(
//                         margin : EdgeInsets.only(right: 23),
//                         child: Text('Manga'),
//                       ),
//                     ),
//                   ],
//                 ) ,
//               ),
//             ),
//
//             Container(
//               margin: EdgeInsets.only(top : 21),
//               height: 210,
//               child: ListView.builder(
//                 padding: EdgeInsets.only(left: ),
//                   itemBuilder:(context , index){
//                 return Container(
//                   height: 210,
//                   width: 153 ,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color : Colors.black ,
//
//
//                     ),
//                 );
//               }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
