import 'package:http/http.dart' as http;
import 'package:multi-book-app/model/posts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PostGetter {
  final String urlKey = '&key=[ADD YOUR KEY HERE]';
  final String urlQuery = 'volumes?q=';
  final String urlBase = 'https://www.googleapis.com/books/v1/';

  Future<List<dynamic>?> getBooks(String query) async {
    final String url = urlBase + urlQuery + query;
    http.Response result = await http.get(Uri(path: url));
    if (result.statusCode == 200) {
      final jsonResponce = json.decode(result.body);
      final booksMap = jsonResponce['items'];
      List<dynamic> books = booksMap.map((e) => Post.fromJson(e));
      return books;
    }
    return null;
  }
}
