import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/feature/auth/repo/newPassword_repo.dart';
import 'package:growlife/src/feature/auth/view/signin.dart';
import 'package:growlife/src/utils/route.dart';


class CreatePasswordController extends ChangeNotifier {
  final CreatePasswordRepository _repository = CreatePasswordRepository();

  Future<void> createPassword(BuildContext context, String password, String confirmPassword,) async {
    try {
      var response = await _repository.createPassword(password,confirmPassword);
      var responseData = json.decode(response.body);
      var message = responseData['message'];

      if (response.statusCode == 200) {
        print("success");
        router.pushReplacement(SignInScreen.routePath);
        ToastMsg.showToast(message);

      } else {
        // Signup failed
        print("failed");
        ToastMsg.showToast(message);
        print(message);
      }
    } catch (error) {
      print('Error signing up: $error');
    }
  }

}
