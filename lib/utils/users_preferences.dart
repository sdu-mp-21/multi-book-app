import 'package:multi-book-app/model/users.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class UsersPreferences {
  static late SharedPreferences _preferences;

  static const _keyUsers = 'users';
  static const myUsers = Users(
    imagePath:
        'https://static.wikia.nocookie.net/anime-characters-fight/images/3/31/Satoru_5003.png/revision/latest?cb=20210404115448&path-prefix=ru',
    name: 'AniStar',
    email: 'anistar.ani@gmail.com',
    about:
        'Nothing',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsers(Users users) async {
    final json = jsonEncode(users.toJson());

    await _preferences.setString(_keyUsers, json);
  }

  static Users getUsers() {
    final json = _preferences.getString(_keyUsers);

    return json == null ? myUsers : Users.fromJson(jsonDecode(json));
  }
}