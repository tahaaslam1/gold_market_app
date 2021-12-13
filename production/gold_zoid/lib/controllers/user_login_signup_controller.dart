import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gold_zoid/models/user_model.dart';
import 'package:gold_zoid/repositries/user_login_signup_repositry.dart';
import 'package:http/http.dart' as http;
import 'package:gold_zoid/controllers/custom_exception_handler.dart';
import 'package:provider/provider.dart';

class UserLoginSignUpController extends ChangeNotifier{

  bool userIsLoggedIn = false;
  User user = new User();

  UserLoginSignupRepositry signUp = UserLoginSignupRepositry();
  
  registerUser(String emailId,String password,String name) async {
    var msg = '';
    try{
    var response = await signUp.registerUser(emailId,password,name);
    var data = _response(response); 
    var responseRepositry = data['Response']; 
    var automatedUserId = data['userId'];
    if(automatedUserId.toString() == null){
      print('haha');
    }
    print('userid : $automatedUserId');
    if(responseRepositry == 'Successfully signed up')
    {
      user.userId = automatedUserId;
      user.emailId = emailId;
      user.name = name; 
      user.password = password;
      user.profileUrl = "https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png"; 
      user.inventory = null;
      user.transactions = null; 

      userIsLoggedIn = true;
      msg = responseRepositry; 
    }
    else if( responseRepositry == 'User Already Registered'){
      msg = responseRepositry;
    }
      }
    catch (e){
      msg = '${e.toString()}';
      print(e);
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
