import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/res/string.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  static const String signInUrl = Api.SignIn;


  Future<http.Response> signin(String key, String password,) async {
    try {
      final response = await http.post(
        Uri.parse(signInUrl),
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
  Future<http.Response> refreshToken(String refreshToken) async {
    final String? refreshTokenUrl= await SharedPreferencesService.getRefreshToken();
    final String? token=await SharedPreferencesService.getToken();
    try {
      final response = await http.post(
        Uri.parse(refreshTokenUrl!),
        body: json.encode({
          'refreshToken': refreshToken,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',

        },
      );
      return response;
    } catch (error) {
      print('Error refreshing token: $error');
      throw error;
    }
  }

}

