import 'package:flutter/material.dart';
import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';

// ignore: must_be_immutable
class MultiOutlinedButton extends StatefulWidget {
  String text;
  MultiOutlinedButton({Key? key, required this.text}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _MultiOutlinedButtonState createState() => _MultiOutlinedButtonState(text);
}

class _MultiOutlinedButtonState extends State<MultiOutlinedButton> {
  bool isSelected = false;
  String name = '';
  var user = creatorPreferences.getCreator();
  _MultiOutlinedButtonState(this.name);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shadowColor: greenColor,
        onSurface: Colors.amber,
        backgroundColor: getColorBytheme(isSelected),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        //margin: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width * 0.17,
        height: 100,
        child: Text(
          name,
          style: TextStyle(color: getColorBytheme(!isSelected)),
        ),
      ),
    );
  }

  void onPressed() {
    setState(() {
      isSelected = (isSelected)?false:true;
    });
  }

  Color getColorBytheme(bool bln) {
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
