import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<void> saveToken(String token) async {
    print("token:,$token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
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

