import 'package:multi-book-app/model/creator.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class CreatorPreferences {
  static late SharedPreferences _preferences;

  static const _keyCreator = 'creator';
  static const myCreator = Creator(
    imagePath:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbXrgpGusbujVYi3qZ-nTgkEmpVlSnPRqGZA&usqp=CAU',
    name: 'Kawaii',
    email: 'anime.fan@gmail.com',
    about:
    'Be cute',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setCreator(Creator creator) async {
    final json = jsonEncode(creator.toJson());

    await _preferences.setString(_keyCreator, json);
  }

  static Creator getCreator() {
    final json = _preferences.getString(_keyCreator);

    return json == null ? myCreator : Creator.fromJson(jsonDecode(json));
  }
}
