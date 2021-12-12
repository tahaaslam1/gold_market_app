import 'package:flutter/material.dart';
import 'package:gold_zoid/controllers/user_login_signup_controller.dart';
import 'package:gold_zoid/models/user_model.dart';
import 'package:gold_zoid/views/widgets/commonWidgets/login_signup_navigator.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/views/widgets/commonWidgets/custom_text_field.dart';
import 'package:gold_zoid/controllers/validation_logic.dart';
import 'package:provider/provider.dart';
import 'package:gold_zoid/controllers/password_show_controller.dart';
import 'package:gold_zoid/controllers/custom_exception_handler.dart';

class Registration_Page extends StatefulWidget {
  @override
  _Registration_PageState createState() => _Registration_PageState();
}

class _Registration_PageState extends State<Registration_Page> {
  // User user = User(userId: '',password: '');
  final _name = TextEditingController();
  final _emailId = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  String _registrationText;
  bool _customSnackbar;
  bool isLogin = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var _validate = ValidationLogic();

  UserLoginSignUpController signUp = UserLoginSignUpController();

  Future<dynamic> _tryRegister(
      String emailId, String password, String name) async {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      try {
        var resgistrationResponse =
            await signUp.registerUser(emailId, password, name);
        if (resgistrationResponse == 'Successfully signed up') {
          print('Register Successfull');
          Navigator.pushReplacementNamed(context, '/homeScreen');
          return resgistrationResponse;
        } else {
          return false;
        }
      } catch (SocketException) {
        return false;
      }
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _emailId.dispose();
    _password.dispose();
    _confirmPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
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
                  controller: _name,
                  textAlign: TextAlign.start,
                  validate: _validate.validateName,
                  obscureText: false,
                  maxLength: null,
                  keyboardType: TextInputType.name,
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: kPrimaryColor,
                    size: 30.0,
                  ),
                  hintText: 'Enter your name',
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomTextField(
                  controller: _emailId,
                  textAlign: TextAlign.start,
                  validate: _validate.validateEmail,
                  obscureText: false,
                  maxLength: null,
                  keyboardType: TextInputType.emailAddress,
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
                      validate: _validate.validatePassword,
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
                  height: 30.0,
                ),
                Consumer<PasswordShowController>(
                  builder: (context, provider, _) {
                    return CustomTextField(
                      controller: _confirmPassword,
                      textAlign: TextAlign.start,
                      validate: _validate.validateConfrimPassword,
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
                  height: 40.0,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      if (!_formKey.currentState.validate()) {
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Enter Correct Credentials',
                              textAlign: TextAlign.center,
                              style: TextStyle(),
                            ),
                          ),
                        );
                      } else {
                        if (_tryRegister(
                                _emailId.text, _password.text, _name.text) ==
                            'Successfully signed up') {
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                'Registration successfull',
                                textAlign: TextAlign.center,
                                style: TextStyle(),
                              ),
                            ),
                          );
                        } else {
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                'User Already Registred with provided email',
                                textAlign: TextAlign.center,
                                style: TextStyle(),
                              ),
                            ),
                          );
                        }
                        // autenticate user and navigate to homePAge..
                      }
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
                ),
                SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: LoginSignUpNavigator(
                      text1: 'Already have an account?',
                      text2: 'Login here',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
