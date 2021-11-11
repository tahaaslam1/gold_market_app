import 'package:flutter/material.dart';
import 'package:gold_zoid/constants.dart';
import 'package:gold_zoid/controllers/login_controller.dart';
import 'package:gold_zoid/views/widgets/commonWidgets/custom_text_field.dart';
import 'package:gold_zoid/views/titles/login_page_title.dart';
import 'package:gold_zoid/views/widgets/commonWidgets/login_signup_navigator.dart';
import 'package:provider/provider.dart';
import 'package:gold_zoid/validationLogic/validation_logic.dart';

// ignore: camel_case_types
class ForgetPassword extends StatelessWidget {
  //bool rememberMeIcon = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var validate = ValidationLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor,),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Recover Password',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: kTitleIconColor,
                  ),
                ), // login page title i.e GOLDZOID in center
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Dont Worry Happens to best of us!',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: kSecondaryTextColor,
                  ),
                ),
                SizedBox(height: 80.0),
                CustomTextField(
                  validate: validate.validateEmail,
                  textAlign: TextAlign.center,
                  obscureText: false,
                  maxLength: null,
                  keyboardType: TextInputType.emailAddress,
                  icon: null,
                  hintText: 'Enter your email address',
                ),
                SizedBox(
                  height: 60.0,
                ),
                SizedBox(
                  width: 5.0,
                ),

                InkWell(
                  onTap: () {
                    //TODO: Recover account logic
                    // some logic...
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        'Recover my account',
                        style: TextStyle(
                          color: kTitleIconColor,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    height: 40.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1.0,
                          color: kPrimaryColor.withOpacity(0.5),
                          blurRadius: 5,
                        ),
                      ],
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
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
