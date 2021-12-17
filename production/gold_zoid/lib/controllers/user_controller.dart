import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gold_zoid/models/user_model.dart';
import 'package:gold_zoid/repositries/user_repositry.dart';

import 'package:provider/provider.dart';

class UserController extends ChangeNotifier {
  UserRepositry reachRepositry = UserRepositry();
  User _user;

  User get getLoggedInUser => _user;

  Future<dynamic> getAllUserDetails({String userEmailId}) async {
    var response =
        await reachRepositry.getAllUserDetails(userEmailId: userEmailId);
    var decodedData = json.decode(response.body);

    _user = User.fromJson(decodedData);
  }

  Future<dynamic> editUserName({String newUserName}) async {
   // _user.name = newUserName; 
    var response = await reachRepositry.editUserName(updatedName: newUserName,userEmailId: _user.emailId);

    var decodedData = json.decode(response);
    if(decodedData['Response'] == 'Updated User Name')
    {
      _user.name = newUserName;
      notifyListeners();
    }
    else{
      return 'User Name Not Updated';
    }
  }

  void editUserEmailAddress() {}

  void editUserProfileUrl(File newProfileUrl) {
    _user.profileUrl = newProfileUrl.toString();

    //print(newProfileUrl.toString());
    notifyListeners();
  }
}
