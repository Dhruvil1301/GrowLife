import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreatePasswordRepository {
  static const String apiUrl = Api.ChangePassword;

  Future<http.Response> createPassword(String password,  String confirmPassword,) async {
    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        body: json.encode({
          'password': password,
          'confirmPassword': confirmPassword,
        }),
        headers:{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await SharedPreferencesServiceForgot.getToken()}',
        },
      );
      return response;
    } catch (error) {
      print('Error signing up: $error');
      throw error;
    }
  }
}
