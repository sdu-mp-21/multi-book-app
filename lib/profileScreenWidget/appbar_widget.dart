import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:multi-book-app/themes.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';

AppBar buildAppBar(BuildContext context) {
  final creator = creatorPreferences.getCreator();
  final isDarkMode = creator.isDarkMode;
  final icon = isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon),
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;

            final switcher = ThemeSwitcher.of(context)!;
            switcher.changeTheme(theme: theme);

            final newCreator = creator.copy(isDarkMode: !isDarkMode);
            creatorPreferences.setCreator(newCreator);
          },
        ),
      ),
    ],
  );
}