import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/feature/auth/repo/emailverification_repo.dart';
import 'package:growlife/src/feature/auth/repo/otpverificationforForgot_repo.dart';
import 'package:growlife/src/feature/auth/repo/signup_repo.dart';
import 'package:growlife/src/feature/auth/view/signin.dart';
import 'package:growlife/src/feature/auth/view/widgets/newPassword.dart';
import 'package:growlife/src/utils/route.dart';

class ForgotVerificationController extends ChangeNotifier {
  final ForgotVerificationRepository _repository = ForgotVerificationRepository();

  Future<void> otpVerification(
      BuildContext context,
      String email,
      String otp,
      ) async {
    try {
      var response = await _repository.otpVerification(
          email,
          otp
      );
      var responseData = json.decode(response.body);
      var message = responseData['message'];
      var token=responseData['token'];
      if (response.statusCode == 200) {
        // Signup successful
        await SharedPreferencesServiceForgot.saveToken(token);
        print("Success");
        ToastMsg.showToast(message);
        router.push(NewPassword.routePath);
      } else {
        // Signup failed
        ToastMsg.showToast(message);
        print("Failed");

      }
    } catch (error) {
      print('Error signing up: $error');
    }
  }

}
