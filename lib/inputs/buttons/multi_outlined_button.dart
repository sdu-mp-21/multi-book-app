import 'package:flutter/material.dart';
import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';

// ignore_for_file: file_names

// ignore: must_be_immutable
class MultiOutlinedButton extends OutlinedButton {
  static var user = CreatorPreferences.getCreator();
  static bool isSelected = false;
  String name;
  
  

  @override
  void Function()? onPressed;

  Widget multiChild;

   MultiOutlinedButton({
    Key? key,
    this.onPressed,
    required this.name,
    required this.multiChild,
    
     
  }) : super(
          key: key,
          child:multiChild,
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shadowColor: greenColor,
            onSurface: Colors.amber,
            backgroundColor: getColorBytheme(false),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
        );

  
  
  static Color getColorBytheme(bool bln) {
    Color color = Colors.black;
    if (bln) {
      if (user.isDarkMode) {
        color = Colors.white;
      } else {
        color = primaryColor;
      }
    } else {
      if (user.isDarkMode) {
        color = primaryColor;
      } else {
        color = Colors.white;
      }
    }
    return color;
  }
}
