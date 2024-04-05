import 'package:final_project/favorite_page/favorite_page.dart';
import 'package:final_project/home_page/home_page.dart';
import 'package:final_project/profile_page/profile_page.dart';
import 'package:final_project/settings_page/settings_page.dart';
import 'package:final_project/sign_in/sign_in.dart';
import 'package:final_project/sign_up/sign_up.dart';
import 'package:final_project/theming.dart';
import 'package:final_project/transition/transition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  int selectedIndex = 0;

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Transition(),
      routes: {
        SignIn.routeName:(context) => SignIn(),
        SignUp.routeName:(context) => SignUp(),
        Transition.routeName:(context) => Transition(),
        FavoritePage.routeName:(context) =>  FavoritePage(),
        ProfilePage.routeName:(context)=> ProfilePage(),
        HomePage.routeName:(context)=> HomePage(),
        SettingsPage.routeName:(context)=> SettingsPage(),
      },
      theme: Theming.lightTheme,
      // darkTheme: Theming.DarkTheme,
    );


}
}