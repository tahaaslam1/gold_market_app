import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';

class CustomTextField extends StatelessWidget {
  final bool obscureText;
  final int maxLength;                //    P ..... R .... O .... B .... L ..... E .... M 
  final TextInputType keyboardType; 
  final Widget icon;
  final String hintText;

  CustomTextField({@required this.obscureText,@required this.maxLength,@required this.keyboardType,@required this.icon,@required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 15.0,
          color: kSecondaryTextColor,
        ),
        //autofocus: false,
        cursorColor: kPrimaryColor,
        cursorHeight: 20.0,
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryTextColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
          counter: Offstage(),
          prefixIcon: icon,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15.0,
            color: kPrimaryTextColor,
          ),
        ),
      ),
    );
  }
}
