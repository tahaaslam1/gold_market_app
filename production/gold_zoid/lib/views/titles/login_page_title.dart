import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class LoginPageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'GOLD',
        style: TextStyle(
          letterSpacing: -1.0,
          color: kPrimaryColor,
          fontSize: 45.0,
          fontFamily: 'Avenir',
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'ZO',
            style: TextStyle(
              letterSpacing: -1.0,
              color: Color(0xFF0000000),
              fontSize: 45.0,
            ),
          ),
          TextSpan(
            text: 'ID',
            style: TextStyle(
              letterSpacing: -1.0,
              color: kPrimaryColor,
              fontSize: 45.0,
            ),
          ),
        ],
      ),
    );
  }
}
