import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/auth/view/signin.dart';
import 'package:growlife/src/feature/profile/view/widgets/userdetailscreen.dart';
import 'package:growlife/src/utils/route.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  static const routePath = "/splash";

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((_) async {
      final authController=ref.read(signInControllerProvider);
      final isTokenExpired = await authController.isTokenExpired();
      if (isTokenExpired) {
         authController.logout();
        await SharedPreferencesService.clearTokens();
        router.pushReplacement(SignInScreen.routePath);
      } else {
        // Token is valid, proceed with user logged in
        final token = await SharedPreferencesService.getToken();
        if (token != null) {
          print(token);
          router.pushReplacement(UserDetailScreen.routePath);
        } else {
          // User is not logged in, navigate to sign in screen
          router.pushReplacement(SignInScreen.routePath);
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xff62B179)),
    );
  }
}
