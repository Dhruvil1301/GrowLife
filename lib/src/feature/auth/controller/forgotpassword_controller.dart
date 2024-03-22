import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/feature/auth/repo/forgotpassword_repo.dart';
import 'package:growlife/src/feature/auth/repo/signup_repo.dart';
import 'package:growlife/src/feature/auth/view/widgets/emailverification.dart';
import 'package:growlife/src/feature/auth/view/widgets/forgotpasswordscreen.dart';
import 'package:growlife/src/feature/auth/view/widgets/verificationscreen.dart';

class ForgotPasswordController extends ChangeNotifier {
  final ForgotPasswordRepository _repository = ForgotPasswordRepository();

  Future<void> forgot(BuildContext context, String email) async {
    try {
      var response = await _repository.forgot(email,);
      var responseData = json.decode(response.body);
      var message = responseData['message'];
      if (response.statusCode == 200) {
        ToastMsg.showToast(message);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VerificationScreen(textToShow: email)),
          );

      } else {
        // Signup failed
        ToastMsg.showToast(message);
        print(message);
      }
    } catch (error) {
      print('Error signing up: $error');
    }
  }
}
