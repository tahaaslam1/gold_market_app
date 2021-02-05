import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(Gold_Zoid());
}



class Gold_Zoid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home_Page(),
    );
  }
}