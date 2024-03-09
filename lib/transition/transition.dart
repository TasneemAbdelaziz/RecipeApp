import 'package:final_project/favorite_page/favorite_page.dart';
import 'package:final_project/home_page/home_page.dart';
import 'package:final_project/profile_page/profile_page.dart';
import 'package:final_project/settings_page/settings_page.dart';
import 'package:flutter/material.dart';

class Transition extends StatefulWidget {
  static const routeName = "Transition";

  const Transition({super.key});

  @override
  State<Transition> createState() => _TransitionState();
}

class _TransitionState extends State<Transition> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(3.0),
                child: ImageIcon(
                  AssetImage("assets/icons/Home.png"),
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/Profile.png")),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: "Settings",
            ),
          ]),
    );
  }
}

List<Widget> tabs = [
  HomePage(),
  FavoritePage(),
  ProfilePage(),
  SettingsPage(),
];
