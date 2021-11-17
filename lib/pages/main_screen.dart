import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/model/posts.dart';
import 'package:multi-book-app/multipages/show_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _current_index = 0;
  List<bool> selected_category = [false, false, false];
  List<Post> posts = [
    Post(
      author: "Zero two",
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. ",
      book: const Image(
        image: NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
      
      body: Column(
        
        
        children: [
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
                    _getOutlined(0, 'AUDIO'),
                    _getOutlined(1, 'VIDEO'),
                    _getOutlined(2, 'MANGA'),
                  ],
                ),
                Container(
                  // width: MediaQuery.of(context).size.width * 0.5,
                  child: const Divider(
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
                  style: const TextStyle(color: Colors.black),
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
                   
                  },
                  child: const Text('SHOW'),
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
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                width: 80,
              ),
              nameBook: "Sasuke")
        ];
      }
    });
  }

// Selected Button

  OutlinedButton _getOutlined(int index, String name) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shadowColor: greenColor,
        onSurface: Colors.amber,
        backgroundColor: (selected_category[index]) ? greenColor : Colors.white,
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
          style: TextStyle(
              color: (selected_category[index]) ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
