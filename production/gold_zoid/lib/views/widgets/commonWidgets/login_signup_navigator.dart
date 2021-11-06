import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class LoginSignUpNavigator extends StatelessWidget {

  final String text1; 
  final String text2;

  LoginSignUpNavigator({@required this.text1,@required this.text2});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(
          color: kSecondaryTextColor,
          fontSize: 15.0,
          fontFamily: 'Avenir',
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' $text2',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 15.0,
              fontFamily: 'Avenir',
            ),
          ),
        ],
      ),
    );
  }
}
