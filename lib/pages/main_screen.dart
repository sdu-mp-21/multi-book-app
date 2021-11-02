import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _current_index = 0;
  List<bool> selected_category = [false, false, false];
  List<Card> posts = [];
  var top_rating = [];
  var mostly_readed = [];
  var new_post = [];

  @override
  void initState() {
    super.initState();
    print('Init');
    posts = [getPost(), getPost(), getPost(), getPost(), getPost()];
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors_selected = [Colors.white, Colors.white, Colors.white];
    return Scaffold(
      body: ListView(children: [
        Container(
          height: 150,
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        (selected_category[0])
                            ? Colors.greenAccent
                            : Colors.white)),
                onPressed: () {
                  setState(() {
                    if (selected_category[0]) {
                      selected_category[0] = false;
                    } else {
                      selected_category[0] = true;
                    }
                  });
                },
                child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: Text(
                    'Video',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              OutlinedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        (selected_category[1])
                            ? Colors.greenAccent
                            : Colors.white)),
                onPressed: () {
                  setState(() {
                    if (selected_category[1]) {
                      selected_category[1] = false;
                    } else {
                      selected_category[1] = true;
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 100,
                  child: Text(
                    'Audio',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              OutlinedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        (selected_category[2])
                            ? Colors.greenAccent
                            : Colors.white)),
                onPressed: () {
                  setState(() {
                    if (selected_category[2]) {
                      selected_category[2] = false;
                    } else {
                      selected_category[2] = true;
                    }
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: const Text(
                    'Comics',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          height: 50,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'New',
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'TOP rating',
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'mostly readed',
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
        getPost(),
        getPost(),
        getPost(),
        getPost(),
        getPost(),
        getPost(),
        getPost(),
      ]),

      //
      bottomNavigationBar: BottomNavigationBar(
       
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box, color: Colors.black),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, color: Colors.black),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
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

  Card getPost() {
    Card result = Card(
        child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Akhmet Miras'),
          subtitle: Text('about book ........'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () {}, child: Text('Like')),
            TextButton(onPressed: () {}, child: Text('comment'))
          ],
        )
      ],
    ));

    return result;
  }
}
