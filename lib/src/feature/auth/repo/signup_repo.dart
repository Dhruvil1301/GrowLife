import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpRepository {
  static const String apiUrl = 'https://growlife-whel.onrender.com/api/v1/auth/signup';

  Future<http.Response> signUp(String username, String email, String password, String confirmPassword) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode({
          'username': username,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      return response;
    } catch (error) {
      print('Error signing up: $error');
      throw error;
    }
  }
}
