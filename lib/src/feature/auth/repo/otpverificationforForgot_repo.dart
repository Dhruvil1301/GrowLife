import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgotVerificationRepository {
  static const String apiUrl = Api.ForgotOtp;

  Future<http.Response> otpVerification(String email, String otp,) async {
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
