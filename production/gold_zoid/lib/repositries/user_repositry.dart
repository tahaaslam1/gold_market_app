import 'dart:convert';

import 'package:gold_zoid/repositries/user_interface.dart';
import 'package:gold_zoid/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepositry implements IUserRepositry {
  Future<dynamic> getAllUserDetails({String userEmailId}) async {
    // post req aegi idher...
    try {
      var response = await http.post(
        Uri.parse('http://192.168.0.108:7000/api/user/getuserdetails'),
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
      print('response: ${response.statusCode}');
      print('response: ${response.body}');
      if (response.statusCode == 200) {
        return response; // yahan user ka pura schema aega
      }
    } catch (e) {
      print(e);
    }
  }
}
