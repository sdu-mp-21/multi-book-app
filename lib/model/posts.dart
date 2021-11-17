import 'package:flutter/material.dart';

class Post {
  String author;
  String description;
  Image book;
  String nameBook;
  int? countOfread;
  int? id;
  dynamic data;
  bool isSelected = false;
  int countlike = 0;

  Post({
    required this.author,
    required this.description,
    required this.book,
    required this.nameBook,
  });

  List<Post>? readJSON() {
    return null;
  }
}
