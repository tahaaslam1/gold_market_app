import 'package:flutter/material.dart';
import 'package:gold_zoid/screens/login_screen.dart';
import 'package:gold_zoid/screens/registration_screen.dart';
import 'screens/home_screen.dart';
import 'package:gold_zoid/screens/trading_screen.dart';
void main() {
  runApp(Gold_Zoid());
}

// ignore: camel_case_types
class Gold_Zoid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Avenir',scaffoldBackgroundColor: Colors.white),
      home: Trade_Page(),
    );
  }
}
