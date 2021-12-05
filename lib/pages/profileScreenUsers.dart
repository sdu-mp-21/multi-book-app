import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:multi-book-app/model/constants.dart';
import 'package:multi-book-app/model/users.dart';
import 'package:multi-book-app/utils/users_preferences.dart';
import 'package:multi-book-app/usersProfileScreenWidget/appbar_widget.dart';
import 'package:multi-book-app/usersProfileScreenWidget/button_widget.dart';
import 'package:multi-book-app/usersProfileScreenWidget/numbers_widget.dart';
import 'package:multi-book-app/usersProfileScreenWidget/profile_widget.dart';
import 'package:multi-book-app/pages/edit_creator_profile_page.dart';

class UsersProfilePage extends StatefulWidget {
  @override
  _UsersProfilePageState createState() => _UsersProfilePageState();


}

class _UsersProfilePageState extends State<UsersProfilePage> {
  int _current_index = 0;

  @override
  Widget build(BuildContext context) {
    final users = UsersPreferences.getUsers();


    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) =>


            Scaffold(
              appBar: buildAppBar(context),
              body: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                 UsersProfileWidget(
                    imagePath: users.imagePath,
                    onClicked: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditProfilePage()),
                      );
                      setState(() {});},
                  ),
                  const SizedBox(height: 24),
                  buildName(users),
                  const SizedBox(height: 24),
                  Center(child: buildUpgradeButton()),
                  const SizedBox(height: 24),
                  NumbersWidget(),
                  const SizedBox(height: 48),
                  buildAbout(users),
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

  Widget buildName(Users users) => Column(
    children: [
      Text(
        users.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        users.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Upgrade To PRO',
    onClicked: () {},
  );

  Widget buildAbout(Users users) => Container(
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
          users.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
}
