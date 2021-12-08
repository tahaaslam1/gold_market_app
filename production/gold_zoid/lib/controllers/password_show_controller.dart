import 'package:flutter/cupertino.dart';

class PasswordShowController extends ChangeNotifier{

  bool _securetext = true; 

  bool get securetext => _securetext;

  void changePasswordIcon(){
    _securetext = !securetext; 
    notifyListeners();
  }
}