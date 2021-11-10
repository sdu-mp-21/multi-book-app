import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:multi-book-app/model/creator.dart';
import 'package:path/path.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';
import 'package:multi-book-app/profileScreenWidget/appbar_widget.dart';
import 'package:multi-book-app/profileScreenWidget/button_widget.dart';
import 'package:multi-book-app/profileScreenWidget/profile_widget.dart';
import 'package:multi-book-app/profileScreenWidget/textfield_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late Creator creator;

  @override
  void initState() {
    super.initState();

    creator = creatorPreferences.getCreator();
  }

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
    child: Builder(
      builder: (context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: creator.imagePath,
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

                setState(() => creator = creator.copy(imagePath: newImage.path));
              },
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: creator.name,
              onChanged: (name) => creator = creator.copy(name: name),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: creator.email,
              onChanged: (email) => creator = creator.copy(email: email),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: creator.about,
              maxLines: 5,
              onChanged: (about) => creator = creator.copy(about: about),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Save',
              onClicked: () {
                creatorPreferences.setCreator(creator);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    ),
  );
}