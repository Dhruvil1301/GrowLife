
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/feature/auth/controller/emailverification_controller.dart';
import 'package:growlife/src/feature/auth/controller/forgotpassword_controller.dart';
import 'package:growlife/src/feature/auth/controller/login_controller.dart';
import 'package:growlife/src/feature/auth/controller/newPassword_controller.dart';
import 'package:growlife/src/feature/auth/controller/otpverificationForgot_controller.dart';
import 'package:growlife/src/feature/auth/controller/signup_controller.dart';
import 'package:growlife/src/feature/post/controller/uploadvideo_controller.dart';
import 'package:growlife/src/feature/profile/controller/uploadprofileimage_controller.dart';
import 'package:growlife/src/feature/profile/controller/userdetail_controller.dart';
import 'package:growlife/src/feature/profile/repo/getallvideo_repo.dart';
import 'package:growlife/src/feature/profile/repo/userdetails_repo.dart';


final signUpControllerProvider = ChangeNotifierProvider((ref) => SignUpController());
final emailVerificationProvider = ChangeNotifierProvider((ref) => EmailVerificationController());
final signInControllerProvider = ChangeNotifierProvider((ref) => AuthController());
final forgotControllerProvider = ChangeNotifierProvider((ref) => ForgotPasswordController());
final forgotVerificationProvider = ChangeNotifierProvider((ref) => ForgotVerificationController());
final createPasswordProvider = ChangeNotifierProvider((ref) => CreatePasswordController());

final uploadFileRepositoryProvider = ChangeNotifierProvider((ref) => ImageUploadController());

final userRepositoryProvider = Provider<UserUpdateRepository>((ref) => UserUpdateRepository());

final userDetailsProvider = ChangeNotifierProvider<UserDetailController>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return UserDetailController(repository);
});

final userControllerProvider = StateNotifierProvider<UserController, AsyncValue<Map<String, dynamic>>>((ref) {
  return UserController();
});



final updateUserDetailsProvider = FutureProvider.autoDispose.family<bool, Map<String, dynamic>>((ref, userDetails) async {
  final controller = ref.read(userDetailsProvider);
  final token = await SharedPreferencesService.getToken();
  final key = await SharedPreferencesServiceKeyForProfile.getKey();
  final email = userDetails['email']; // Extracting email from userDetails

  if (token != null && key != null && email != null) {
    return controller.updateUserDetails( email, userDetails);
  }
  return false;
});
final uploadVideoFileRepositoryProvider = ChangeNotifierProvider((ref) => VideoUploadController());



