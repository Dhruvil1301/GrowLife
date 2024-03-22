import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgotPasswordRepository {
  static const String apiUrl = Api.Forgot;

  Future<http.Response> forgot( String email) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode({
          'email': email,
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
