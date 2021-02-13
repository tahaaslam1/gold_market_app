import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/commonWidgets/custom_text_field.dart';

class Registration_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Sign ',
                    style: TextStyle(
                      letterSpacing: -1.0,
                      color: kPrimaryColor,
                      fontSize: 45.0,
                      fontFamily: 'Avenir',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'up',
                        style: TextStyle(
                          letterSpacing: -1.0,
                          color: Color(0xFF0000000),
                          fontSize: 45.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              CustomTextField(
                obscureText: false,
                maxLength: null,
                keyboardType: TextInputType.name,
                icon: Icon(
                  Icons.person_outline,
                  color: kPrimaryColor,
                  size: 35.0,
                ),
                hintText: 'Enter your name',
              ),
              SizedBox(
                height: 30.0,
              ),
              CustomTextField(
                obscureText: false,
                maxLength: 13,
                keyboardType: TextInputType.phone,
                icon: Icon(
                  Icons.call_outlined,
                  color: kPrimaryColor,
                  size: 35.0,
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
                  size: 35.0,
                ),
                hintText: 'Enter your password',
              ),
              SizedBox(
                height: 30.0,
              ),
              CustomTextField(
                obscureText: true,
                maxLength: null,
                keyboardType: TextInputType.name,
                icon: Icon(
                  Icons.lock_outline,
                  color: kPrimaryColor,
                  size: 35.0,
                ),
                hintText: 'Confirm your password',
              ),
              SizedBox(
                height: 40.0,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    // autenticate user and navigate to homePAge..
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: kSecondaryTextColor,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                    height: 60.0,
                    width: 315.0,
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
              ),
              SizedBox(
                height: 25.0,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    // navigate to Sign up screen
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(
                        color: kSecondaryTextColor,
                        fontSize: 17.0,
                        fontFamily: 'Avenir',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Login here',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 17.0,
                            fontFamily: 'Avenir',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
