import 'package:flutter/material.dart';
import 'package:multi-book-app/multipages/audio_page.dart';
import 'package:multi-book-app/multipages/manga_page.dart';
import 'package:multi-book-app/multipages/video_page.dart';

class ListOfCreatersPage extends StatefulWidget {
  late String nameOfCategory = '';
  ListOfCreatersPage(this.nameOfCategory, {Key? key}) : super(key: key);

  @override
  _ListOfCreatersPageState createState() =>
      _ListOfCreatersPageState(nameOfCategory);
}

class _ListOfCreatersPageState extends State<ListOfCreatersPage> {
  String nameOfCategory;
  _ListOfCreatersPageState(this.nameOfCategory);
      

  var pages = {
    // ignore: prefer_const_constructors
    'Manga': MangaScreenPage(),
    // ignore: prefer_const_constructors
    'Video': VideoScreenPage(),
    // ignore: prefer_const_constructors
    'Audio': AudioScreenPage(),
  };

  var tempListOfCreaters = [
    'Ali Se',
    'Kimetsu No',
    'Kaneki ken',
    'Jennie Kim',
    'Park Shin Hye',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(nameOfCategory + ' creaters list'),
          backgroundColor: Colors.black,
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: tempListOfCreaters.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading:Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.person),
                    Text('2520'),
                    
                    
                    ],
                  
                  ),
                title: Text(
                  tempListOfCreaters[index],
                  style: const TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text('subscribers:' + '5'),
                    
                    Text('book rating : 5.0'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => pages[nameOfCategory] as Widget ));
                },
              );
            }));
  }
}
