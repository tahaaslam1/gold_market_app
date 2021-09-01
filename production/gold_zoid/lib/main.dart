
import 'package:flutter/material.dart';
import 'package:gold_zoid/controllers/marketController.dart';
import 'views/screens/home_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(Gold_Zoid());
}

// ignore: camel_case_types
class Gold_Zoid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Avenir',scaffoldBackgroundColor: Colors.white),
      home: ListenableProvider(
        create:(context) => MarketController(),
        child: Home_Page(),
        ),
    );
  }
}
