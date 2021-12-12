import 'dart:convert';
import 'dart:io';

import 'package:gold_zoid/repositries/user_login_signup_interface.dart';
import 'package:http/http.dart' as http;

import 'package:gold_zoid/controllers/custom_exception_handler.dart';

class UserLoginSignupRepositry implements IUserLoginSignupRepositry {
  
  registerUser(String userEmailId, String userPassword, String userName) async {
    var responseJson;
    try {
      var response = await http.post(
        "http://192.168.0.105:3000/api/signup",
        headers: <String, String>{'Content-Type': 'application/json;charset=UTF-8','Charset': 'utf-8'},
        body: jsonEncode(
          <String, String>{
            "name": userName,
            "emailId": userEmailId,
            "password": userPassword,
          },
        ),
      );
      responseJson = _response(response);
    } catch (SocketException) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('No Internet Connection');
    }
  }
}
