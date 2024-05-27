import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/feature/auth/view/signin.dart';
import 'package:growlife/src/res/string.dart';
import 'package:growlife/src/utils/route.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  static const String signInUrl = Api.SignIn;


  Future<http.Response> signin(String key, String password,) async {
    String? fcmToken=  await FcmTokenManager.getFcmToken();
    try {
      final response = await http.post(
        Uri.parse(signInUrl),
        body: json.encode({
          'key': key,
          'password': password,
          'fcmToken':fcmToken,
        }),
        headers:{
          'Content-Type': 'application/json; charset=UTF-8',
        },
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
  final String logoutApi = Api.logout; // Replace with your backend URL

  Future<void> logout() async {
    final String? fcmToken = await FcmTokenManager.getFcmToken();
    final String? bearerToken=await SharedPreferencesService.getToken();
    if (fcmToken == null) {
      throw Exception('FCM token is not available');
    }

    final url = Uri.parse(logoutApi);
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'fcmToken': fcmToken,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to logout');
    }
    else{
      ToastMsg.showToast("Logout Successfully Visit Again!");
      router.pushReplacement(SignInScreen.routePath);
    }
  }
}

