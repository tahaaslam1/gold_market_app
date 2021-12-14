import 'dart:convert';
import 'dart:io';

import 'package:gold_zoid/repositries/user_login_signup_interface.dart';
import 'package:http/http.dart' as http;

import 'package:gold_zoid/controllers/custom_exception_handler.dart';

class UserLoginSignupRepositry implements IUserLoginSignupRepositry {
 
  registerUser(String userEmailId, String userPassword, String userName) async {
    try {
      var response = await http.post(
        "http://192.168.0.105:7000/api/user/signup",
        headers: <String, String>{'Content-Type': 'application/json;charset=UTF-8','Charset': 'utf-8'},
        body: jsonEncode(
          <String, String>{
            "name": userName,
            "emailId": userEmailId,
            "password": userPassword,
          },
        ),
      );
      return response;  
    } catch (e) {
      return e;
    }
  }

  loginUser(String userEmailId, String userPassword) async {
    try {
      var response = await http.post(
        "http://192.168.0.105:7000/api/user/login",
        headers: <String, String>{'Content-Type': 'application/json;charset=UTF-8','Charset': 'utf-8'},
        body: jsonEncode(
          <String, String>{
            "emailId": userEmailId,
            "password": userPassword,
          },
        ),
      );
      return response;  
    } catch (e) {
      return e;
    }
  }
 }
