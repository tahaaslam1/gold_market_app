import 'package:flutter/cupertino.dart';
import 'package:gold_zoid/repositries/user_login_signup_repositry.dart';
import 'package:http/http.dart' as http;

class UserLoginSignUpController{

  UserLoginSignupRepositry signUp = UserLoginSignupRepositry();
  
  Future<String> registerUser(String emailId,String password,String name) async {
    var msg = '';

    msg = await signUp.registerUser(emailId,password,name);

    print('after sign up msg : $msg');
    return msg;
  }
    
}
