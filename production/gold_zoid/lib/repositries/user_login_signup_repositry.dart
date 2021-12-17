import 'dart:convert';
import 'dart:io';

import 'package:gold_zoid/repositries/interfaces/user_login_signup_interface.dart';
import 'package:http/http.dart' as http;

import 'package:gold_zoid/controllers/custom_exception_handler.dart';

class UserLoginSignupRepositry implements IUserLoginSignupRepositry {
  registerUser(String userEmailId, String userPassword, String userName) async {
    try {
      var response = await http.post(
        Uri.parse('http://192.168.0.113:7000/api/user/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(
          <String, String>{
            "name": userName,
            "emailId": userEmailId,
            "password": userPassword,
          },
        ),
      );
      print('Registration response status code:  ${response.statusCode}');
      print('Registration response.body :  ${response.body}');

    var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      //print('registration exception: ${e}');
      throw FetchDataException('No internet Connection');
    }
  }

  loginUser(String userEmailId, String userPassword) async {
    try {
      var response = await http.post(
        Uri.parse('http://192.168.0.113:7000/api/user/login'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(
          <String, String>{
            "emailId": userEmailId,
            "password": userPassword,
          },
        ),
      );
      print('login response status code:  ${response.statusCode}');
      print('login response.body :  ${response.body}');
      var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      //print('login exception: ${e}');
      throw FetchDataException('No internet Connection');
    }
  }



  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response; //= json.decode(response.body);
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
