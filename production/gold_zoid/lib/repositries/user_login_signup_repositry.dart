import 'package:gold_zoid/repositries/user_login_signup_interface.dart';
import 'package:http/http.dart' as http;

class UserLoginSignupRepositry implements IUserLoginSignupRepositry {
  Future<dynamic> registerUser(
      String userEmailId, String userPassword, String userName) async {
    var msg = '';

    try {
      var response = await http.post(
        "http://localhost:3000/signup",
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF=8'
        },
        body: <String, String>{
          "name": userName,
          "emailId": userEmailId,
          "password": userPassword,
        },
      );
      print(response.body);
      return response.body;
    } catch (e) {
      print('1: $e');
    }
  }
}
