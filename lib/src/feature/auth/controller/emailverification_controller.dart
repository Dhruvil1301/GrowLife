import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/feature/auth/repo/emailverification_repo.dart';
import 'package:growlife/src/feature/auth/repo/signup_repo.dart';
import 'package:growlife/src/feature/auth/view/signin.dart';
import 'package:growlife/src/utils/route.dart';

class EmailVerificationController extends ChangeNotifier {
  final EmailVerificationRepository _repository = EmailVerificationRepository();

  Future<void> signUpVerification(
      BuildContext context,
      String email,
      String otp,
      ) async {
    try {
      var response = await _repository.signUpVerification(
        email,
        otp
      );
      var responseData = json.decode(response.body);
      var message = responseData['message'];
      if (response.statusCode == 200) {
        // Signup successful
        print("Success");
        SnackbarHelper.showSuccess(context, message);
        router.pushReplacement(SignInScreen.routePath);
      } else {
        // Signup failed
        SnackbarHelper.showError(context, message);
        print("Failed");

      }
    } catch (error) {
      print('Error signing up: $error');
    }
  }

}
