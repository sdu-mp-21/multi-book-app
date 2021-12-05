import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:multi-book-app/model/users.dart';
import 'package:path/path.dart';
import 'package:multi-book-app/utils/users_preferences.dart';
import 'package:multi-book-app/usersProfileScreenWidget/appbar_widget.dart';
import 'package:multi-book-app/usersProfileScreenWidget/button_widget.dart';
import 'package:multi-book-app/usersProfileScreenWidget/profile_widget.dart';
import 'package:multi-book-app/usersProfileScreenWidget/textfield_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class EditUsersProfilePage extends StatefulWidget {
  const EditUsersProfilePage({Key? key}) : super(key: key);

  @override
  _EditUsersProfilePageState createState() => _EditUsersProfilePageState();
}

class _EditUsersProfilePageState extends State<EditUsersProfilePage> {
  late Users users;

  @override
  void initState() {
    users = UsersPreferences.getUsers();

    super.initState();

  }

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
    child: Builder(
      builder: (context) => Scaffold(
        // appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            UsersProfileWidget(
              imagePath: users.imagePath,
              isEdit: true,
              onClicked: () async {
                final image = await ImagePicker()
                    .getImage(source: ImageSource.gallery);

                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage =
                await File(image.path).copy(imageFile.path);

                setState(() => users = users.copy(imagePath: newImage.path));
              },
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: users.name,
              onChanged: (name) => users = users.copy(name: name),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: users.email,
              onChanged: (email) => users = users.copy(email: email),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: users.about,
              maxLines: 5,
              onChanged: (about) => users = users.copy(about: about),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Save',
              onClicked: () {
                UsersPreferences.setUsers(users);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    ),
  );
}