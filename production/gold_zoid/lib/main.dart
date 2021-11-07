import 'package:flutter/material.dart';
import 'package:gold_zoid/controllers/marketController.dart';
import 'package:gold_zoid/views/screens/account_screen.dart';
import 'package:gold_zoid/views/screens/inventory_screen.dart';
import 'package:gold_zoid/views/screens/login_screen.dart';
import 'package:gold_zoid/views/screens/registration_screen.dart';
import 'package:gold_zoid/views/screens/trading_screen.dart';
import 'package:gold_zoid/views/titles/home_page_title.dart';
import 'views/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:gold_zoid/views/widgets/drawer/drawer.dart';
import 'controllers/login_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create : (_) => LoginController()),
      ],
      child: Gold_Zoid(),
    ),
  );
}

// ignore: camel_case_types
class Gold_Zoid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/homeScreen',
      routes: {
        '/loginScreen': (context) => Login_Page(),
        '/registrationScreen': (context) => Registration_Page(),
        '/homeScreen': (context) => Home_Page(),
        '/tradingScreen': (context) => Trade_Page(),
        '/accountScreen': (context) => Account_Page(),
        '/inventoryScreen': (context) => Inventory_Page(),
        '/drawerScreen': (context) => CustomDrawer(),
      },
      theme: ThemeData(
          fontFamily: 'Avenir', scaffoldBackgroundColor: Colors.white),
    );
  }
}
