import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(token);
    await prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> saveRefreshToken(String refreshToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(refreshToken);
    await prefs.setString('refreshToken', refreshToken);
  }

  static Future<String?> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('refreshToken');
  }

  static Future<void> clearTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('refreshToken');
  }
}
class SharedPreferencesServiceForgot {
  static Future<void> saveToken(String token) async {
    print("Forgottoken:,$token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Forgettoken', token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
class SharedPreferencesServiceKeyForProfile {
  static Future<void> saveKey(String key) async {
    print("key:,$key");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('key', key);
  }

  static Future<String?> getKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('key');
  }
}
class SharedPreferencesServiceUser {
  static Future<void> saveUser(String userId) async {
    print("key:,$userId");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  static Future<String?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }
}
