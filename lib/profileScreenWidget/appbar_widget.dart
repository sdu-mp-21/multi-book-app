import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = IconData(59353, fontFamily: 'MaterialIcons');
  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(onPressed: () {}, icon: Icon(icon)),
    ],
  );
}
