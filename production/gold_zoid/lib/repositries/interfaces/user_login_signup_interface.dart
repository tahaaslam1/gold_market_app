
abstract class IUserLoginSignupRepositry{ 
  Future<dynamic> registerUser( String userEmailId, String userPassword, String userName);
  Future<dynamic> loginUser( String userEmailId, String userPassword);
  
}