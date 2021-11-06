class ValidationLogic{
  
  String validatePassword(value) {
    String pattern = r'(^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$)';  //Minimum 6 characters, at least one letter, one number and one special character:
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty)
      return "Password required";
    else if(!regExp.hasMatch(value)){
      return "Enter a valid password";
    }
    else 
      return null;
  }
String validatePhoneNumber(value) {
    String pattern = r'(^(?:[+0][92])?[0-9]{11,13}$)';  //Minimum 6 characters, at least one letter, one number and one special character:
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty)
      return "Phone number required";
    else if(!regExp.hasMatch(value)){
      return "Enter a valid password";
    }
    else 
      return null;
  }



}