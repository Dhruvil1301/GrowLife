import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/Common/View/pages/welcomescreen.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';



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
           ChangeNotifierProvider(create: (context) => WishlistProvider()),
          ChangeNotifierProvider(create: (context) => CameraProvider()),
          ChangeNotifierProvider(create: (context) => VideoProvider()),
          ChangeNotifierProvider(create: (context) => DashboardNavigationProvider()),



        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final MyNavigatorObserver navigatorObserver = MyNavigatorObserver();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [navigatorObserver],
      title: 'Grow Life',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:WelcomeScreen(),
    ); 
  }
}


