import 'dart:convert';

import 'package:flutter/material.dart';

class Post {
  String? id;
  String? author;
  String? description;
  String? bookUrl;
  String? publisher;
  String? nameBook;
  int? countOfread;
  bool isSelected = false;
  int countlike = 0;

  Post(
    this.id,
    this.author,
    this.description,
    this.bookUrl,
    this.nameBook,
  );

  factory Post.postFromJson(Map<String, dynamic> json) {
    String? id = json['id'];
    String description = (json['volumeInfo']['description'] == null)
        ? ''
        : json['volumeInfo']['description'];
    String? author = (json['volumeInfo']['authors'] == null)
        ? ''
        : json['volumeInfo']['authors'].toString();
    author = author.replaceAll('[', '');
    author = author.replaceAll(']', '');
    
    String? bookUrl = json['volumeInfo']['imageLinks']['smallThumbnail']??= '';

    

    String? nameBook = (json['volumeInfo']['title'] == null)
        ? ''
        : json['volumeInfo']['title'];

    return Post(id, author, description, bookUrl, nameBook);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'post: $id || $description || $author';
  }
}
