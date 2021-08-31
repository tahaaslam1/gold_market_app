import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gold_zoid/controllers/marketController.dart';
import 'package:gold_zoid/screens/inventory_screen.dart';
import 'package:gold_zoid/views/screens/login_screen.dart';
import 'package:gold_zoid/views/screens/registration_screen.dart';
import 'views/screens/home_screen.dart';
import 'package:gold_zoid/views/screens/trading_screen.dart';
import 'package:gold_zoid/views/screens/account_screen.dart';
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
