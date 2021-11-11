import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/controllers/login_controller.dart';
import 'package:gold_zoid/views/widgets/commonWidgets/custom_text_field.dart';
import 'package:gold_zoid/views/titles/login_page_title.dart';
import 'package:gold_zoid/views/widgets/commonWidgets/login_signup_navigator.dart';
import 'package:provider/provider.dart';
import 'package:gold_zoid/validationLogic/validation_logic.dart';

// ignore: camel_case_types
class Login_Page extends StatelessWidget {
  //bool rememberMeIcon = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var validate = ValidationLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
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
                    textAlign: TextAlign.start,
                    validate: validate.validatePhoneNumber,
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
                    textAlign: TextAlign.start,
                    
                    validate: validate.validatePassword,
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
                        child: Consumer<LoginController>(
                          builder: (context, provider, _) {
                            return InkWell(
                              splashColor: Colors.white,
                              onTap: () => provider.changeIcon(),
                              child: Icon(
                                provider.rememberMe
                                    ? Icons.check_circle_outline
                                    : Icons
                                        .circle_notifications, //TODO: change icon to something "only a circle";
                                color: kPrimaryColor,
                              ),
                            );
                          },
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
                            Navigator.pushNamed(context, '/forgetPasswordScreen');
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
                      //TODO: check validation and check password and navigate to home screen
                      // some logic...
                      Navigator.pushNamed(
                        context,
                        '/homeScreen',
                      ); //TODO: remove this after above is implemented..
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
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/registrationScreen');
                    },
                    child: LoginSignUpNavigator(
                      text1: 'Don\'t have an account?',
                      text2: 'Signup here',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
