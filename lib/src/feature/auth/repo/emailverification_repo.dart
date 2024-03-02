import 'package:http/http.dart' as http;
import 'dart:convert';

class EmailVerificationRepository {
  static const String apiUrl = 'https://growlife-whel.onrender.com/api/v1/auth/saveuser';

  Future<http.Response> signUpVerification(String email, String otp,) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode({
          'email': email,
           'otp':otp,
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
