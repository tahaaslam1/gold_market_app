import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/controllers/password_show_controller.dart';
import 'package:gold_zoid/views/widgets/commonWidgets/custom_text_field.dart';
import 'package:gold_zoid/views/titles/login_page_title.dart';
import 'package:gold_zoid/views/widgets/commonWidgets/login_signup_navigator.dart';
import 'package:provider/provider.dart';
import 'package:gold_zoid/controllers/validation_logic.dart';
import 'package:provider/provider.dart';
import 'package:gold_zoid/controllers/user_login_signup_controller.dart';

// ignore: camel_case_types
class Login_Page extends StatefulWidget {
  //bool rememberMeIcon = true;
  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var validate = ValidationLogic();

  final _emailId = TextEditingController();
  final _password = TextEditingController();

    void _failSnackbar(String error) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(),
      ),
    );
    //_scaffoldKey.currentState.showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _passSnackbar(String msg) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(),
      ),
    );
    //_scaffoldKey.currentState.showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  void _tryLogin(String emailId, String password) async {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      try {
        var loginResponse =
            await Provider.of<UserLoginSignUpController>(context, listen: false)
                .loginUser(emailId, password);
        if (loginResponse == 'Successfully Logged In') {
          _passSnackbar(loginResponse);
          Navigator.pushReplacementNamed(context, '/homeScreen');
        } else if (loginResponse == 'Invalid Email or Password') {
          _failSnackbar(loginResponse);
        } else {
          _failSnackbar(loginResponse);
        }
      } catch (e) {
        _failSnackbar(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
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
                    controller: _emailId,
                    textAlign: TextAlign.start,
                    validate: validate.validateEmail,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    maxLength: null,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: kPrimaryColor,
                      size: 30.0,
                    ),
                    hintText: 'Enter your email address',
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Consumer<PasswordShowController>(
                    builder: (context, provider, _) {
                      return CustomTextField(
                        controller: _password,
                        textAlign: TextAlign.start,
                        validate: validate.validatePassword,
                        maxLength: null,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: kPrimaryColor,
                          size: 30.0,
                        ),
                        suffixIcon: InkWell(
                          onTap: () => provider.changePasswordIcon(),
                          child: Icon(
                            provider.securetext
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            color: kPrimaryColor,
                            size: 30.0,
                          ),
                        ),
                        obscureText: provider.securetext,
                        hintText: 'Enter your password',
                      );
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right:
                                15.0), //TODO: sett accordingly on seeing in mobitle
                        child: InkWell(
                          onTap: () {
                            print('Navigate to Forgot Password Screen');
                            // Navigate to Forgot Password Screen
                            Navigator.pushNamed(
                                context, '/forgetPasswordScreen');
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
                  SizedBox(height: 30.0),
                  InkWell(
                    onTap: () {
                      if (!_formKey.currentState.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Enter Correct crendentials',
                              textAlign: TextAlign.center,
                              style: TextStyle(),
                            ),
                          ),
                        );
                      } else {
                        _tryLogin(_emailId.text, _password.text);
                       }
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
