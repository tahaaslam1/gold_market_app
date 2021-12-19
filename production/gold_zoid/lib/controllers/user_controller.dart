import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gold_zoid/models/user_model.dart';
import 'package:gold_zoid/repositries/user_repositry.dart';

import 'package:provider/provider.dart';

import 'custom_exception_handler.dart';

class UserController extends ChangeNotifier {
  UserRepositry reachRepositry = UserRepositry();
  User _user;

  User get getLoggedInUser => _user;

  Future<dynamic> getAllUserDetails({String userEmailId}) async {
    try{
    var response =
        await reachRepositry.getAllUserDetails(userEmailId: userEmailId);
    var decodedData = json.decode(response.body);
    _user = User.fromJson(decodedData); 
    print('in get user details: ${_user.inventory.totalGold}');
    return response;
    } on SocketException{
      throw FetchDataException('No Internet Connection');
    }
  }

  Future<dynamic> editUserName({String newUserName}) async {
   // _user.name = newUserName; 
    var response = await reachRepositry.editUserName(updatedName: newUserName,userEmailId: _user.userId);
    var decodedData = json.decode(response.body);
    if(decodedData['Response'] == 'Updated User Name')
    {
      _user.name = newUserName;
      notifyListeners();
    }
    else if(decodedData['Response'] == 'Text Field should not be empty'){
      return 'Text Field should not be empty';
    }
    else{
      return 'User Name Not Updated';
    }
  }

  void editUserEmailAddress() {}   //TODO: not doing this functionality for now...

   editUserProfileUrl(String newProfileUrl) async {
    
   var response = await reachRepositry.editUserProfileUrl(userEmailId: _user.userId,updatedProfileUrl: newProfileUrl);
    var decodedData = json.decode(response.body);
    if(decodedData['Response'] == 'Updated User Profile Url')
    {
      _user.profileUrl =  newProfileUrl;
      notifyListeners();
    }
    else{
      return 'User Profile Url Not Updated';
    }
  }
}
