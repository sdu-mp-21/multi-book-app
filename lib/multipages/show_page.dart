import 'package:flutter/material.dart';
import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/model/posts.dart';

class ShowPage extends StatefulWidget {
  Post post;
  ShowPage({Key? key,  required this.post}) : super(key: key);

  @override
  _ShowPageState createState() => _ShowPageState(post: post);
}

class _ShowPageState extends State<ShowPage> {
  Post post;
  _ShowPageState({ required this.post});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Card(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [post.book,Text(post.nameBook)],
                  ),
                  Column(
                    children: [
                      Text(post.nameBook),
                      Text(post.description),

                    ],
                  ),
                ],
              ),
              const Divider(
                color: greenColor,
                thickness: 0.5,
                endIndent: 15,
                indent: 15,
                
              ),
            ],

          ),
        ),
      ),
    );
  }
}
