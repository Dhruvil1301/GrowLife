import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/feature/auth/repo/signup_repo.dart';
import 'package:growlife/src/feature/auth/view/widgets/emailverification.dart';

class SignUpController extends ChangeNotifier {
  final SignUpRepository _repository = SignUpRepository();

  Future<void> signUp(BuildContext context, String email, String username, String password, String confirmPassword) async {
    try {
      var response = await _repository.signUp(username, email, password, confirmPassword);
      var responseData = json.decode(response.body);
      var message = responseData['message'];
      if (response.statusCode == 200) {
      SnackbarHelper.showSuccess(context, message);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EmailVerification(email: email)),
          );
        });
      } else {
        // Signup failed
        SnackbarHelper.showError(context, message);
        print(message);
      }
    } catch (error) {
      print('Error signing up: $error');
    }
  }
}
