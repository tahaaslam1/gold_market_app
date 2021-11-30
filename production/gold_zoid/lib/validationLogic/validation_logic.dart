class ValidationLogic{
  var _confrimPass;

  String validatePassword(value) {
    _confrimPass = value;
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
      return "Enter a valid phone number";
    }
    else 
      return null;
  }
 String validateName(value) {
    if (value.isEmpty)
      return "Name required";
    else 
      return null;
  }
String validateConfrimPassword(value) {
    String pattern = r'(^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$)';  //Minimum 6 characters, at least one letter, one number and one special character:
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty)
      return "Password required";
    else if(!regExp.hasMatch(value)){
      return "Enter a valid password";
    }
    else if(value != _confrimPass){
      return "Password must be same as above";
    }
    else 
      return null;
  }
 // emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
 String validateEmail(value) {
    String pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';  //Minimum 6 characters, at least one letter, one number and one special character:
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty)
      return "Email required";
    else if(!regExp.hasMatch(value)){
      return "Enter a valid email";
    }
    else 
      return null;
  }

}