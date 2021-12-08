import 'package:flutter/material.dart';
import 'package:gold_zoid/controllers/marketController.dart';
import 'package:gold_zoid/testservices.dart';
import 'package:gold_zoid/views/screens/account_screen.dart';
import 'package:gold_zoid/views/screens/forget_password_screen.dart';
import 'package:gold_zoid/views/screens/inventory/inventory_screen.dart';
import 'package:gold_zoid/views/screens/inventory/items_list_screen.dart';
import 'package:gold_zoid/views/screens/login_screen.dart';
import 'package:gold_zoid/views/screens/registration_screen.dart';
import 'package:gold_zoid/views/screens/trading_screen.dart';
import 'package:gold_zoid/views/titles/home_page_title.dart';
import 'views/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'controllers/password_show_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create : (_) => PasswordShowController()),
      ],
      child: Gold_Zoid(),
    ),
  );
  loadInventory('U-486');
}

// ignore: camel_case_types
class Gold_Zoid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/loginScreen',
      routes: {
        '/loginScreen': (context) => Login_Page(),
        '/registrationScreen': (context) => Registration_Page(),
        '/homeScreen': (context) => Home_Page(),
        '/tradingScreen': (context) => Trade_Page(),
        '/accountScreen': (context) => Account_Page(),
        '/inventoryScreen': (context) => Inventory_Page(),
        '/forgetPasswordScreen' :(context) => ForgetPassword(),
        '/itemListScreen': (context) => ItemListScreen(),
      },
      theme: ThemeData(
          fontFamily: 'Avenir', scaffoldBackgroundColor: Colors.white),
    );
  }
}
