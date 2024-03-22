import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growlife/src/feature/shopping/view/shopping.dart';
import 'package:growlife/src/feature/welcome/view/welcomescreen.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/utils/route.dart';
import 'package:responsive_builder/responsive_builder.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context,child){
          return  MaterialApp.router(

              title: 'Grow Life',
              debugShowCheckedModeBanner: false,
              theme:ThemeData(
                  primarySwatch: Colors.blue,
                  primaryColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                      color: Colors.white
                  )
              ),
            routerConfig: router,
          );
        },);
    });
  }
}