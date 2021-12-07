import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:multi-book-app/inputs/buttons/multi_outlined_button.dart';
import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/model/posts.dart';
import 'package:multi-book-app/model/services.dart';
import 'package:multi-book-app/multipages/show_page.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';
import 'package:multi-book-app/utils/users_preferences.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var user = CreatorPreferences.getCreator();

  // ignore: non_constant_identifier_names
  int _current_index = 0;
  // ignore: non_constant_identifier_names
  static List<bool> selected_category = [false, false, false];
  List<Post> posts = [
    // Post(
    //   author: "J.K. Rowling",
    //   description:
    //       "Rowling and the sixth and penultimate novel in the Harry Potter series. Set during Harry Potter's sixth year at Hogwarts, the novel explores the past of the boy wizard's nemesis, Lord Voldemort, and Harry's preparations for the final battle against Voldemort alongside his headmaster and mentor Albus Dumbledore. ",
    //   book: const Image(
    //     image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO7jM-DdqTl2dM597fLOve9eu4jIUavk67iQ&usqp=CAU'),
    //     width: 80,
    //   ),
    //   nameBook: "Harry Potter",
    // ),
    Post('', '', '', "nameBook", ''),
  ];

  var queryOfBooks = ['Abay', 'Olzhas Suleimenov', 'Harry Potter'];
  var top_rating = [];
  var mostly_readed = [];
  var new_post = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: greenColor,
            ),

          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: MultiOutlinedButton(text: 'Manga'),
                    ),
                    Expanded(
                      child: MultiOutlinedButton(text: 'Video'),
                    ),
                    Expanded(
                      child: MultiOutlinedButton(text: 'Audio'),
                    ),
                  ],
                ),
                SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.5,
                  child: Divider(
                    thickness: 1.5,
                    color: greenColor,
                    endIndent: 25,
                    indent: 25,
                  ),
                ),
              ]),
        ),
        SizedBox(
          height: 500,
          child:ListView(children:[
        _getNameCategory('Popular'),
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            Row(
              children: [
                FutureBuilder<List<dynamic>?>(
                    future: getPost('Harry Potter'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Widget> arr = [];
                        for (int i = 0; i < snapshot.data!.length; i++) {
                          var temp = snapshot.data![i] as Post;
                          arr.add(postTemplate(temp));
                        }

                        return Row(children: arr);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                    
              ],
            ),
          ]),
        ),
        
        _getNameCategory('Top ratings'),

        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            Row(
              children: [
                 FutureBuilder<List<dynamic>?> (
                    future: getPost('harryPotter'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Widget> arr = [];
                        for (int i = 0; i < snapshot.data!.length; i++) {
                          var temp = snapshot.data![i] as Post;
                          arr.add(postTemplate(temp));
                        }

                        return Row(children: arr);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                    
              ],
            ),
          ]),
        ),
        ])
        )]
      ),
      

      //
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: primaryColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: primaryColor),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box, color: primaryColor),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, color: primaryColor),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: primaryColor),
            label: 'Profile',
          ),
        ],
        currentIndex: _current_index,
        onTap: _navigater,
      ),
    );
  }

  void _navigater(int i) {
    const routes = ['/', '/search', '/create', '/wallet', '/profile'];
    setState(() {
      _current_index = i;
    });

    Navigator.popAndPushNamed(context, routes[i]);
  }

  postTemplate(Post? post) {
    // ignore: avoid_print
    //print(post!.description);
    post!.author ??= 'Noname';
    
    // ignore: avoid_print

    // print(post.author);

    // print(post?.nameBook);
    // print('this is PRINT');

    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          shadowColor: greenColor,
          shape: Border.all(width: 0.1, style: BorderStyle.solid),
          elevation: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Image(image: NetworkImage(post.bookUrl??=''),
              width: 100,
              height: 150,
              
              ),
              Text(
                post.nameBook??='',
                softWrap: true,
                style: const TextStyle(
                  fontSize: 20,
                  
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     SizedBox(
          //         width: MediaQuery.of(context).size.width * 0.25,
          //         child: Column(children: [
          //           // ((post.book == null)?post.book:Text('not Found image')),
          //           Text(
          //             post.nameBook ??= '',
          //           )
          //         ])),
          //     Container(
          //       height: 200,
          //       width: MediaQuery.of(context).size.width * 0.5,
          //       margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Text(
          //             post.author ??= 'Noname',
          //             style: const TextStyle(
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           Text(
          //             post.description ??= '',
          //             softWrap: true,
          //           ),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
        ));
  }

  void _showSelectedByCategory(String value) {}

  Widget _getNameCategory(String s) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black,
        ),
        child: Text(
          s,
        ));
  }

// Selected Button
  Color getColorByTheme(bool bln) {
    Color color = Colors.black;
    if (bln) {
      if (user.isDarkMode) {
        color = Colors.white;
      } else {
        color = primaryColor;
      }
    } else {
      if (user.isDarkMode) {
        color = primaryColor;
      } else {
        color = Colors.white;
      }
    }
    return color;
  }

   OutlinedButton _getOutlined(int index, String name) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shadowColor: greenColor,
        onSurface: Colors.amber,
        backgroundColor: getColorByTheme(selected_category[index]),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
      onPressed: () {
        setState(() {
          if (selected_category[index]) {
            selected_category[index] = false;
          } else {
            selected_category[index] = true;
          }
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width * 0.20,
        height: 100,
        child: Text(
          name,
          style: TextStyle(color: getColorByTheme(!selected_category[index])),
        ),
      ),
    );
  }

}
