import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(Gold_Zoid());
}

// ignore: camel_case_types
class Gold_Zoid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Avenir',scaffoldBackgroundColor: Colors.white),
      home: Home_Page(),
    );
  }
}
