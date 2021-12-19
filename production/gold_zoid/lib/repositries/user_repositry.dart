import 'dart:convert';
import 'dart:io';

import 'package:gold_zoid/controllers/custom_exception_handler.dart';
import 'package:gold_zoid/repositries/interfaces/user_interface.dart';
import 'package:gold_zoid/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepositry implements IUserRepositry {
  
  Future<dynamic> getAllUserDetails({String userEmailId}) async {
    // post req aegi idher...
    try {
      var response = await http.post(
        Uri.parse('http://192.168.0.109:7000/api/user/getuserdetails'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(
          <String, String>{
            "emailId": userEmailId,
          },
        ),
      );
      print('get details response status : ${response.statusCode}');
      print('get details response body: ${response.body}');
      var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      //print(e);
      throw FetchDataException('No Internet Connection');
    }
  }

  Future<dynamic> editUserName({String userEmailId, String updatedName}) async {
    // post req aegi idher...
    try {
      print('user whose name is being updated : $userEmailId');
      print('updated name : $updatedName');     
      var response = await http.put(
        Uri.parse(
            'http://192.168.0.109:7000/api/user/updateUserName/$userEmailId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            "name": updatedName,
          },
        ),
      );
      print('edit name response status: ${response.statusCode}');
      print('edit name response: ${response.body}');
      var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      //print(e);
      throw FetchDataException('No Internet Connection');
    }
  }
  Future<dynamic> editUserProfileUrl({String userEmailId, String updatedProfileUrl}) async {
    // post req aegi idher...
    try {
      var response = await http.put(
        Uri.parse(
            'http://192.168.0.109:7000/api/user/updateProfileUrl/$userEmailId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            "profileUrl": updatedProfileUrl,
          },
        ),
      );
      print('edit url response status: ${response.statusCode}');
      print('edit url response: ${response.body}');
      var responseJson = _response(response);
      return responseJson;
    } on SocketException {
      //print(e);
      throw FetchDataException('No Internet Connection');
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
      case 404:
        var responseJson = json.decode(response.body);
        throw PageNotFoundException(responseJson['Response'].toString());  
      case 500:
      default:
        throw FetchDataException('No Internet Connection');
    }
  }
}
