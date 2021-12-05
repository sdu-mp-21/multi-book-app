import 'dart:convert';

import 'package:multi-book-app/model/posts.dart';
import 'package:http/http.dart' as http;
import 'posts.dart';

String urlBase = 'https://www.googleapis.com/books/v1/';
String urlQuery = 'volumes?q=';

Future<List<dynamic>?> getPost(String Query) async {
  final response = await http.get(Uri.parse(urlBase + urlQuery + Query));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final booksMap = json['items'];
    List<dynamic> books = booksMap.map((i) => Post.postFromJson(i)).toList();
    return books;
  }
  return null;
}
