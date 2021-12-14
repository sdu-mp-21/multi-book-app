import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/model/posts.dart';
import 'package:multi-book-app/model/services.dart';
import 'package:multi-book-app/multipages/show_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
   TextEditingController txtNamebook = TextEditingController();
  String search_name = '';
  get greenColor => Colors.black;
  @override
  void initState() {
    // TODO: implement initState
    txtNamebook = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        
      ),
      body: Column(
        children: [
        SizedBox(
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              child:
              TextField(
                controller: txtNamebook,
              
            ),

            ),
            
            IconButton(
                onPressed: () {
                  setState(() {
                    search_name = txtNamebook.text;
                  });
                },
                icon: const Icon(Icons.search)),
          ]),
        ),
        const Divider(
          thickness:2.5,
          indent: 25,
          endIndent:25 ,
        ),
        Container(

              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
            ),
            child: Text(
            search_name,
            style: const TextStyle(color: Colors.white),
          ),
              
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            //shrinkWrap: true,
            
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: [
              
                  (search_name!='')?
                  FutureBuilder<List<dynamic>?>(
                  future: getPost(search_name),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                              List<Widget> arr = [];
                              for (int i = 0; i < snapshot.data!.length; i++) {
                                var temp = snapshot.data![i] as Post;
                                arr.add(bookCanvasTemplate(temp));
                              }

                              return Row(children: arr);
                            } 
                            else {
                              return const CircularProgressIndicator();
                            }
                  }):const Text(''),
                  ],)
            ],
          ),
        ),
      ]),
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
        currentIndex: 1,
        onTap: _navigater,
      ),
    );
  }

  void _navigater(int i) {
    const routes = ['/', '/search', '/create', '/wallet', '/profile'];
    setState(() {});

    Navigator.popAndPushNamed(context, routes[i]);
  }

  Widget bookCanvasTemplate(Post post) {
    post.author ??= 'Noname';

    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ShowPage(post: post);
              }));
            },
            child: Card(
              // margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              shadowColor: greenColor,
              shape: Border.all(width: 0.1, style: BorderStyle.solid),
              elevation: 250,
              child:
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 150,
                  minWidth: 200,
                ),
                child: 
                
                
                  Image(
                    image: NetworkImage(post.bookUrl ??= ''),
                    
                    
                    
                  ),
                  )
                  
              
            )
            )
            );
  }
}
