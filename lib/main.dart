import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/app.dart';
import 'package:provider/provider.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(
    DoubleClickToExitApp(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NavigationProvider()),
          ChangeNotifierProvider(create: (context) => CustomImageProvider()),
          ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),
          ChangeNotifierProvider(create: (context) => StarRatingProvider()),
          ChangeNotifierProvider(create: (context) => CameraProvider()),
          ChangeNotifierProvider(create: (context) => VideoProvider()),

        ],
        child: App(),
      ),
    ),
  );
}


