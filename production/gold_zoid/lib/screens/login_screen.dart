import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/commonWidgets/custom_text_field.dart';
import 'package:gold_zoid/titles/login_page_title.dart';
import 'package:gold_zoid/commonWidgets/login_signup_navigator.dart';

// ignore: camel_case_types
class Login_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120.0,
                ),
                LoginPageTitle(), // login page title i.e GOLDZOID in center
                SizedBox(
                  height: 100.0,
                ),
                CustomTextField(
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  maxLength: 13,
                  icon: Icon(
                    Icons.call_outlined,
                    color: kPrimaryColor,
                    size: 30.0,
                  ),
                  hintText: 'Enter your phone number',
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomTextField(
                  obscureText: true,
                  maxLength: null,
                  keyboardType: TextInputType.visiblePassword,
                  icon: Icon(
                    Icons.lock_outline,
                    color: kPrimaryColor,
                    size: 30.0,
                  ),
                  hintText: 'Enter your password',
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          // change the Icon from check_circle_outline to empty circle
                          print('remember me');
                        },
                        child: Icon(
                          Icons.check_circle_outline,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: kSecondaryTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: () {
                          print('Navigate to Forgot Password Screen');
                          // Navigate to Forgot Password Screen
                        },
                        child: Text(
                          'Forgot password ?',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 45.0),
                InkWell(
                  onTap: () {
                    // autenticate user and navigate to homePAge..
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: kSecondaryTextColor,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                    height: 55.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2.0,
                          color: kPrimaryColor.withOpacity(0.5),
                          blurRadius: 10,
                        ),
                      ],
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                LoginSignUpNavigator(text1: 'Don\'t have an account?',text2: 'Signup here',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

