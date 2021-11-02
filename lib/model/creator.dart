import 'package:flutter/material.dart';

class Creator {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;

  const Creator({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
  });
}
