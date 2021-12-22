import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gold_zoid/models/user_model.dart';
import 'package:gold_zoid/repositries/interfaces/user_login_signup_interface.dart';
import 'package:gold_zoid/repositries/user_login_signup_repositry.dart';
import 'package:http/http.dart' as http;
import 'package:gold_zoid/controllers/custom_exception_handler.dart';
import 'package:provider/provider.dart';

class UserLoginSignUpController extends ChangeNotifier {
  
  User _user;

  final IUserLoginSignupRepositry reachRepositry = UserLoginSignupRepositry();

  User get getLoggedInUser => _user;  //builder.name 

  registerUser(String emailId, String password, String name) async {
    var msg = '';
    try {
      var response = await reachRepositry.registerUser(emailId, password, name);
      var decodedData = _response(response);
      var responseRepositry = decodedData['Response'];
      if (responseRepositry == 'Successfully signed up') {
        _user = User.fromJson(decodedData);
        msg = responseRepositry;
      } else if (responseRepositry == 'User Already Registered') {
        msg = responseRepositry;
      }
    } catch (e) {
      msg = '${e.toString()}';
    }

    return msg;
  }

  loginUser(String emailId, String password) async {
    var msg = '';
    try {
      var response = await reachRepositry.loginUser(emailId, password);
      var decodedData = _response(response);
      var responseRepositry = decodedData['Response'];

      if (responseRepositry == 'Successfully Logged In') {
        _user = User.fromJson(decodedData); // parsing user data ... .... .
        msg = responseRepositry;
      } else if (responseRepositry == 'Invalid Email or Password') {
        msg = responseRepositry;
      }
    } catch (e) {
      msg = '${e.toString()}';
    }

    return msg;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body);
        throw BadRequestException(responseJson['Response'].toString());
      case 401:
      case 403:
        var responseJson = json.decode(response.body);
        throw UnauthorisedException(responseJson['Response'].toString());
      case 500:
      default:
        throw FetchDataException('No Internet Connection');
    }
  }
}
