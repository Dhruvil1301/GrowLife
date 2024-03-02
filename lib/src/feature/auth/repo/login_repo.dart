import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  static const String apiUrl = 'https://growlife-whel.onrender.com/api/v1/auth/login';

  Future<http.Response> signin(String key,  String password,) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode({
          'key': key,
          'password': password,
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
