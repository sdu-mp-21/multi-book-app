import 'package:multi-book-app/model/creator.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class creatorPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'creator';
  static const myCreator = Creator(
    imagePath:
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Sarah Abs',
    email: 'sarah.abs@gmail.com',
    about:
    'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setCreator(Creator creator) async {
    final json = jsonEncode(creator.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static Creator getCreator() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myCreator : Creator.fromJson(jsonDecode(json));
  }
}
