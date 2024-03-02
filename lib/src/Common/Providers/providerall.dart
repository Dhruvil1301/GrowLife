import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/feature/auth/controller/emailverification_controller.dart';
import 'package:growlife/src/feature/auth/controller/login_controller.dart';
import 'package:growlife/src/feature/auth/controller/signup_controller.dart';

final signUpControllerProvider = ChangeNotifierProvider((ref) => SignUpController());
final emailVerificationProvider = ChangeNotifierProvider((ref) => EmailVerificationController());
final signInControllerProvider = ChangeNotifierProvider((ref) => AuthController());