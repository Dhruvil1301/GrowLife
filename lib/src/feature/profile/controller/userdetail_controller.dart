import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/Common/view/widgets/snackbar.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/feature/profile/repo/userdetails_repo.dart';
import 'package:growlife/src/utils/route.dart';

class UserDetailController extends ChangeNotifier {
  final UserUpdateRepository _repository;
  UserDetailController(this._repository);

  Map<String, dynamic>? _userData;
  Map<String, dynamic>? get userData => _userData;



  Future<bool> updateUserDetails(String email,Map<String, dynamic> userDetails) async {
    final token = await SharedPreferencesService.getToken();
    final key = await SharedPreferencesServiceKeyForProfile.getKey();
    if (token !=null  && key !=null) {
      final success = await _repository.updateUser(token,key,email, userDetails);
      if (success) {
        _userData?.addAll(userDetails);
        notifyListeners();
        ToastMsg.showToast("Profile Updated");
       router.pushReplacement(HomeScreen.routePath);
      }
      return success;
    } else {
      print('Token not available.');
      return false;
    }
  }
}

class UserController extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final UserUpdateRepository _userRepository = UserUpdateRepository();

  UserController() : super(const AsyncLoading()) {
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    try {
      final token = await SharedPreferencesService.getToken();
      if (token != null) {
        final userDetails = await _userRepository.fetchUserDetails(token);
        state = AsyncData(userDetails);
      } else {
        throw Exception('Token not available.');
      }
    } catch (error) {
      print("Error in fetch ");
    }
  }
}
