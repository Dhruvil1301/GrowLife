import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/feature/auth/repo/login_repo.dart';
import 'package:growlife/src/feature/profile/repo/userdetails_repo.dart';
import 'package:growlife/src/feature/profile/view/widgets/userdetailscreen.dart';
import 'package:growlife/src/utils/route.dart';


class AuthController extends ChangeNotifier {
  final AuthRepository _repository = AuthRepository();
  String? _userId; // Variable to store user ID

  String? get userId => _userId;
  Future<void> signin(BuildContext context, String key, String password,) async {
    try {
      var response = await _repository.signin(key,password);
      var responseData = json.decode(response.body);
      var message = responseData['message'];
      var token=responseData['token'];
      var userid=responseData['user']['_id'];

      if (response.statusCode == 200) {
        _userId = userid;
        await SharedPreferencesService.saveToken(token);
        print("sucess");
        print(userid);
        router.pushReplacement(UserDetailScreen.routePath);
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
