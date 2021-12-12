import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gold_zoid/repositries/user_login_signup_repositry.dart';
import 'package:http/http.dart' as http;
import 'package:gold_zoid/controllers/custom_exception_handler.dart';


class UserLoginSignUpController {
  
  UserLoginSignupRepositry signUp = UserLoginSignupRepositry();
  
  registerUser(String emailId,String password,String name) async {
    
    try{
    var responseRespositry = await signUp.registerUser(emailId,password,name);
    print('2: after sign up msg : $responseRespositry');
    return responseRespositry; 
    }
    catch (e){
      print('exception 2 : $e');
    }
    
  }
    
}
