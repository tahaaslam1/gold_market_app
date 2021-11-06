import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier{

  bool _rememberMe = true; 

  bool get rememberMe => _rememberMe;

  void changeIcon(){
    _rememberMe = !rememberMe; 
    notifyListeners();
  }
}