import 'package:flutter/cupertino.dart';

class NewBookModel {
  String image;

  NewBookModel(this.image);
}

List<NewBookModel> newbooks =
newBookData.map((item) => NewBookModel(
    item['image'] as String
)).toList();

var newBookData = [
  {"image": "assets/images/Volume_1.png"},
  {"image": "assets/images/Volume_2.png"},
  {"image": "assets/images/Volume_3.png"},
  {"image": "assets/images/Volume_1.png"},
  {"image": "assets/images/Volume_2.png"},
  {"image": "assets/images/Volume_3.png"},
  {"image": "assets/images/Volume_1.png"},
  {"image": "assets/images/Volume_3.png"},
];