import 'dart:convert';

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

  Map<String, dynamic>? readJSON() {
    String jsonString = '..\\multi-book-app\\lib\\jsonFile\\postList.json';
    Map<String, dynamic> user = jsonDecode(jsonString);
    return user;
  }

  static List<dynamic>? fromJson(int i) {
    return null;
  }
}
