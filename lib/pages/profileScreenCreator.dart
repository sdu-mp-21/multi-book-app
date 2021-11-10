import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:multi-book-app/model/creator.dart';
import 'package:multi-book-app/profileScreenWidget/appbar_widget.dart';
import 'package:multi-book-app/profileScreenWidget/button_widget.dart';
import 'package:multi-book-app/profileScreenWidget/numbers_widget.dart';
import 'package:multi-book-app/profileScreenWidget/profile_widget.dart';
import 'package:multi-book-app/utils/creator_preferences.dart';
import 'package:multi-book-app/profileScreenWidget/appbar_widget.dart';
import 'package:multi-book-app/profileScreenWidget/button_widget.dart';
import 'package:multi-book-app/profileScreenWidget/numbers_widget.dart';
import 'package:multi-book-app/profileScreenWidget/profile_widget.dart';
import 'edit_creator_profile_page.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final creator = creatorPreferences.getCreator();

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: creator.imagePath,
                onClicked: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 24),
              buildName(creator),
              const SizedBox(height: 24),
              Center(child: buildUpgradeButton()),
              const SizedBox(height: 24),
              NumbersWidget(),
              const SizedBox(height: 48),
              buildAbout(creator),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(Creator creator) => Column(
    children: [
      Text(
        creator.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        creator.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Upgrade To PRO',
    onClicked: () {},
  );

  Widget buildAbout(Creator creator) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          creator.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
}