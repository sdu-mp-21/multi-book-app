import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';
import 'package:multi-book-app/model/constants.dart';

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
import 'package:multi-book-app/pages/edit_creator_profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _current_index = 0;

  @override
  Widget build(BuildContext context) {
    final creator = creatorPreferences.getCreator();


    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) =>


            Scaffold(
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
                    setState(() {});},
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
              bottomNavigationBar: BottomNavigationBar(

                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: primaryColor),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search, color: primaryColor),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_box, color: primaryColor),
                    label: 'Create',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                        Icons.account_balance_wallet, color: primaryColor),
                    label: 'Wallet',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: primaryColor),
                    label: 'Profile',
                  ),
                ],
                // currentIndex: _current_index,
                // onTap: _navigater,

              ),
            ),
      ),

    );
  }



  void _navigater(int i) {
    const routes = ['/', '/search', '/create', '/wallet', '/profile'];
    setState(() {
      _current_index = i;
    });

    Navigator.popAndPushNamed(context, routes[i]);
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
