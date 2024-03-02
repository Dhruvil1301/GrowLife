import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/feature/auth/repo/login_repo.dart';
import 'package:growlife/src/feature/profile/view/widgets/userdetailscreen.dart';
import 'package:growlife/src/utils/route.dart';


class AuthController extends ChangeNotifier {
  final AuthRepository _repository = AuthRepository();

  Future<void> signin(BuildContext context, String key, String password,) async {
    try {
      var response = await _repository.signin(key,password);
      var responseData = json.decode(response.body);
      var message = responseData['message'];
      var token=responseData['token'];

      if (response.statusCode == 200) {
        await SharedPreferencesService.saveToken(token);
        print("sucess");
        router.pushReplacement(UserDetailScreen.routePath);
        SnackbarHelper.showSuccess(context, message);

      } else {
        // Signup failed
        print("failed");
        SnackbarHelper.showError(context, message);
        print(message);
      }
    } catch (error) {
      print('Error signing up: $error');
    }
  }

}
