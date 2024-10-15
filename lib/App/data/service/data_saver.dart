import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static String? firstName, lastName, token, profilePic, mobile, email;

  static bool isLoggedIn = false;

  static Future<void> saveUserData(String uToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', uToken);
    // await sharedPreferences.setString('firstName', uFirstName);
    // await sharedPreferences.setString('lastName', uLastName);
    // await sharedPreferences.setString('mobile', uMobile);
    // await sharedPreferences.setString('photo', uProfilePic);
    // await sharedPreferences.setString('email', uEmail);
    // firstName = uFirstName;
    // lastName = uLastName;
    // mobile = uMobile;
    // profilePic = uProfilePic;
    token = uToken;
   // email = uEmail;
  }

  static Future<bool> checkLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    if (token == null) {
      isLoggedIn = false;
      return false;
    } else {
      isLoggedIn = true;
      return true;
    }
  }

  static Future<String> getAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    print(token);
    return token ?? '';
    // firstName = sharedPreferences.getString('firstName');
    // lastName = sharedPreferences.getString('lastName');
    // profilePic = sharedPreferences.getString('photo');
    // mobile = sharedPreferences.getString('mobile');
    // email = sharedPreferences.getString('email');

  }

  static Future<void> clearData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

}