import 'package:flutter/material.dart';
import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/model/posts.dart';
import 'package:multi-book-app/inputs/buttons/multi_outlined_button.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';

// ignore: must_be_immutable
class ShowPage extends StatefulWidget {
  Post post;
  ShowPage({Key? key, required this.post}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ShowPageState createState() => _ShowPageState(post: post);
}

class _ShowPageState extends State<ShowPage> {

  Post post;
  _ShowPageState({required this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: 
      ListView(
        children:[
      
      Column(children: [
        Card(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.32,
                         
                          child: Image(
                            image: NetworkImage(post.bookUrl??=''),
                            width: 100,
                            height: 150,
                            
                            ),
                        ),
                        Text(post.nameBook??='')
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: MediaQuery.of(context).size.width * 0.45,
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            post.nameBook??='',
                            textAlign: TextAlign.center,
                            
                            ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            // height: 300,
                            child:  Text(
                            post.description??='',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                          ),
                         
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('readed:8562'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        
                          Text(post.countlike.toString()),
                            MaterialButton(
                            focusColor: Colors.grey,
                            minWidth: 25,
                            child: const Icon(
                              Icons.favorite,
                              color: primaryColor,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                post.countlike += 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: greenColor,
                  thickness: 0.5,
                  endIndent: 15,
                  indent: 15,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height:300,
          
          child: Card(
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: MultiOutlinedButton(text: 'Manga'),),
              Expanded(child: MultiOutlinedButton(text: 'Video'),),
              Expanded(child: MultiOutlinedButton(text: 'Audio'),),
              
              

            ],
          ),
        ),
        )
      ]),
        ])
    );
  }
}
