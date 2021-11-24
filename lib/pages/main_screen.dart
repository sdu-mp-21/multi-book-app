import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi-book-app/inputs/buttons/multi_outlined_button.dart';
import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/model/posts.dart';
import 'package:multi-book-app/multipages/show_page.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var user = creatorPreferences.getCreator();

  // ignore: non_constant_identifier_names
  int _current_index = 0;
  // ignore: non_constant_identifier_names
  static List<bool> selected_category = [false, false, false];
  List<Post> posts = [
    Post(
      author: "J.K. Rowling",
      description:
          "Rowling and the sixth and penultimate novel in the Harry Potter series. Set during Harry Potter's sixth year at Hogwarts, the novel explores the past of the boy wizard's nemesis, Lord Voldemort, and Harry's preparations for the final battle against Voldemort alongside his headmaster and mentor Albus Dumbledore. ",
      book: const Image(
        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO7jM-DdqTl2dM597fLOve9eu4jIUavk67iQ&usqp=CAU'),
        width: 80,
      ),
      nameBook: "Harry Potter",
    ),
  ];
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

            // borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MultiOutlinedButton(text: 'Manga'),
                    MultiOutlinedButton(text: 'Video'),
                    MultiOutlinedButton(text: 'Audio'),
                  ],
                ),
                Container(
                  // width: MediaQuery.of(context).size.width * 0.5,
                  child: Divider(
                    thickness: 1.5,
                    color: greenColor,
                    endIndent: 25,
                    indent: 25,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 50,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.20,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: OutlinedButton(
                          onPressed: () {
                            _showSelectedByCategory('NEW');
                          },
                          child: const Text(
                            'NEW',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: greenColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.20,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: OutlinedButton(
                          onPressed: () {
                            _showSelectedByCategory('TOP');
                          },
                          child: const Text(
                            'TOP rating',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: greenColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.20,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: OutlinedButton(
                          onPressed: () {
                            _showSelectedByCategory('Mostly readed');
                          },
                          child: const Text(
                            'Mostly readed',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: greenColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ),
        Container(
          height: 500,
          child: SingleChildScrollView(
            child: Column(children: [
              StreamBuilder(builder:
                  (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  return Column(
                    children: [
                      postTemplate(posts[0]),
                      postTemplate(posts[0]),
                      postTemplate(posts[0]),
                      postTemplate(posts[0]),
                      postTemplate(posts[0]),
                    ],
                  );
                }
              }),
            ]),
          ),
        )
      ]),

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

  Widget postTemplate(Post post) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      shadowColor: greenColor,
      shape: Border.all(width: 0.1, style: BorderStyle.solid),
      elevation: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Column(children: [
                post.book,
                Text(
                  post.nameBook,
                )
              ])),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.5,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  post.author,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  post.description,
                  softWrap: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    // open showpage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowPage(
                                post: post,
                              )),
                    );
                  },
                  child: const Text(
                    'SHOW',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(greenColor)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showSelectedByCategory(String value) {
    setState(() {
      if (value == 'NEW') {
        posts = [
          Post(
              author: "RAM",
              description: "Something",
              book: const Image(
                image: AssetImage('./images/book_max_fray.jpg'),
                width: 80,
              ),
              nameBook: "Lalisa")
        ];
      }
      if (value == 'TOP') {
        posts = [
          Post(
              author: "Nezuko",
              description: "Something",
              book: const Image(
                image: AssetImage('./images/book_max_fray.jpg'),
                width: 80,
              ),
              nameBook: "IU")
        ];
      }
      if (value == 'Mostly readed') {
        posts = [
          Post(
              author: "Naruto",
              description: "Something",
              book: const Image(
                image: AssetImage('./images/book_max_fray.jpg'),
                width: 80,
              ),
              nameBook: "Sasuke")
        ];
      }
    });
  }

// Selected Button

}
