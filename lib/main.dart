import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/Common/View/AdminPanel/adminpanel.dart';
import 'package:growlife/src/Common/View/pages/welcomescreen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';




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

    return ResponsiveBuilder(builder: (context,sizingInformation){
      return ScreenUtilInit(
        designSize: const Size(1920, 1800),
          builder: (context,child){
        if(sizingInformation.deviceScreenType==DeviceScreenType.desktop){

          return MaterialApp(
              navigatorObservers: [navigatorObserver],
              title: 'Admin Panel of grow life',
              debugShowCheckedModeBanner: false,
              theme:ThemeData(
                  primarySwatch: Colors.green
              ),



              home: AdminPanel(),


          );
        }
        else{
         return MaterialApp(
              navigatorObservers: [navigatorObserver],
              title: 'Grow Life',
              debugShowCheckedModeBanner: false,
              theme:ThemeData(
                  primarySwatch: Colors.blue
              ),



              home: AnimatedSplashScreen(splash: Expanded(
                child: Column(
                  children: [
                    Image.asset("assets/images/Growlife.png",width:   MediaQuery.of(context).size.width*.25,),


                  ],
                ),
              ),
                nextScreen: WelcomeScreen(),
                splashTransition: SplashTransition.scaleTransition,
              )
          );
        }
      });
    });
  }
}

