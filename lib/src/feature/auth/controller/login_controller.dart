import 'dart:convert';
import 'package:dart_jwt_token/dart_jwt_token.dart';
import 'package:flutter/material.dart';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/feature/auth/repo/login_repo.dart';
import 'package:growlife/src/feature/auth/view/signin.dart';
import 'package:growlife/src/feature/profile/view/widgets/userdetailscreen.dart';
import 'package:growlife/src/utils/route.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository _repository = AuthRepository();
  String? _userId; // Variable to store user ID

  String? get userId => _userId;

  Future<void> signin(BuildContext context, String key, String password) async {
    try {
      var response = await _repository.signin(key, password);
      var responseData = json.decode(response.body);
      var message = responseData['message'];

      if (response.statusCode == 200) {
        var token = responseData['accessToken'];
        var userId = responseData['user']['_id'];
        var refreshToken = responseData['refreshToken'];
        _userId = userId;
        await SharedPreferencesService.saveToken(token);
        await SharedPreferencesService.saveRefreshToken(refreshToken);
        await SharedPreferencesServiceUser.saveUser(userId);// Save the refresh token
        print("Success");
        print(userId);
        router.pushReplacement(UserDetailScreen.routePath);
        ToastMsg.showToast(message);
      } else {
        // Signup failed
        print("Failed");
        ToastMsg.showToast(message);
        print(message);
      }
    } catch (error) {
      print('Error signing up: $error');
    }
  }

  // Method to check if the access token is expired
  Future<bool> isTokenExpired() async {
    var token = await SharedPreferencesService.getToken();
    if (token != null) {
      // Parse the token and extract its expiration time
      var decodedToken = JWT.decode(token);
      var expirationTimeInSeconds = decodedToken.payload['exp'];

      // Get the current time in seconds
      var currentTimeInSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      // Check if the token is expired by comparing the expiration time with the current time
      return expirationTimeInSeconds < currentTimeInSeconds;
    } else {
      // Token is not available, consider it expired
      return true;
    }
  }

// Method to refresh the access token using the refresh token
  Future<void> refreshAccessToken() async {
    try {
      var refreshToken = await SharedPreferencesService.getRefreshToken();
      if (refreshToken != null) {
        // Make API call to refresh the token using the refresh token
        var refreshedTokenResponse = await _repository.refreshToken(refreshToken);

        // If the refresh token is valid and the API call is successful
        if (refreshedTokenResponse.statusCode == 200) {
          var refreshedTokenData = json.decode(refreshedTokenResponse.body);
          var newAccessToken = refreshedTokenData['accessToken'];

          // Save the new access token in shared preferences
          await SharedPreferencesService.saveToken(newAccessToken);

          // Token refreshed successfully
          print('Access token refreshed.');
        } else {
          // Handle error if the refresh token is expired or invalid
          print('Error refreshing access token: ${refreshedTokenResponse.body}');
        }
      } else {
        // Refresh token is not available, navigate to login screen or perform logout
        print('Refresh token not available. Logging out...');
        logout();
      }
    } catch (error) {
      print('Error refreshing access token: $error');
    }
  }

  void logout() async {
    try {
      await SharedPreferencesService.clearTokens();
      // Perform any additional logout tasks if needed
      // For example, navigate to the login screen
      router.pushReplacement(SignInScreen.routePath);
    } catch (error) {
      print('Error logging out: $error');
    }
  }
}
