// import 'package:flutter/material.dart';
// import 'package:multi-book-app/model/constants.dart';
// import 'package:multi-book-app/model/posts.dart';
// import 'package:multi-book-app/inputs/buttons/multi_outlined_button.dart';
// import 'package:multi-book-app/utils/creator_preferences.dart';

// // ignore: must_be_immutable
// class ShowPage extends StatefulWidget {
//   Post post;
//   ShowPage({Key? key, required this.post}) : super(key: key);

//   @override
//   // ignore: no_logic_in_create_state
//   _ShowPageState createState() => _ShowPageState(post: post);
// }

<<<<<<< HEAD
class _ShowPageState extends State<ShowPage> {
=======
// class _ShowPageState extends State<ShowPage> {
//   var user = creatorPreferences.getCreator();
>>>>>>> 1206eac4e2ead8dab7e611bc4dd808ee56dffc77

//   Post post;
//   _ShowPageState({required this.post});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//       ),
//       body: 
//       ListView(
//         children:[
      
//       Column(children: [
//         Card(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Row(
//                   children: [
//                     Column(
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.4,
//                           height: 300,
//                           child: post.book,
//                         ),
//                         Text(post.nameBook='')
//                       ],
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 15),
//                       width: MediaQuery.of(context).size.width * 0.5,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(post.nameBook=''),
//                           Text(
//                             post.description='',
//                             softWrap: true,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       const Text('readed:8562'),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
                        
//                           Text(post.countlike.toString()),
//                             MaterialButton(
//                             focusColor: Colors.grey,
//                             minWidth: 25,
//                             child: const Icon(
//                               Icons.favorite,
//                               color: primaryColor,
//                               size: 20,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 post.countlike += 1;
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   color: greenColor,
//                   thickness: 0.5,
//                   endIndent: 15,
//                   indent: 15,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height:300,
          
//           child: Card(
          
<<<<<<< HEAD
          child: Row(
            children: [
              // MultiOutlinedButton(text: 'Manga'),
              // MultiOutlinedButton(text: 'Video'),
              // MultiOutlinedButton(text: 'Audio'),
=======
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Expanded(child: MultiOutlinedButton(text: 'Manga'),),
//               Expanded(child: MultiOutlinedButton(text: 'Video'),),
//               Expanded(child: MultiOutlinedButton(text: 'Audio'),),
              
              
>>>>>>> 1206eac4e2ead8dab7e611bc4dd808ee56dffc77

//             ],
//           ),
//         ),
//         )
//       ]),
//         ])
//     );
//   }
// }
