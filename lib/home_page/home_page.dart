import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  static const routeName = "HomePage";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home"),
    );
  }
}
