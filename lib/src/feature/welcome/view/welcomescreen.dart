import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/permission/view/notificationscreen.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';
class WelcomeScreen extends StatelessWidget {

  const WelcomeScreen({Key? key}) : super(key: key);
  static const routePath="/welcome";
  @override
  Widget build(BuildContext context) {
    final height=  MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(

        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(ImageAssets.welcome,fit: BoxFit.fill,height: 280.h,),
                    Text("GROWLIFE",style: GoogleFonts.plusJakartaSans(fontSize: 32,letterSpacing: 6,fontWeight: FontWeight.w700,color: Colors.white),)

                  ],
                ),

                SizedBox(height:20.h,),
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset(ImageAssets.growlife,fit: BoxFit.cover,height: 45.h,),),
                SizedBox(height:10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Welcome to ",style: GoogleFonts.plusJakartaSans(fontSize:  28,fontWeight: FontWeight.w700),),
                    Image.asset(ImageAssets.growlifeText,height:24.h),
                  ],),
                SizedBox(height: 15.h,),
                Text("Discover the beauty of nature \n& contribute to a greener world",style: GoogleFonts.poppins(fontSize: 18,wordSpacing: 1,letterSpacing: 1,fontWeight: FontWeight.w400),),
                SizedBox(height: 35.h,),
                InkWell(
                  onTap: (){
                    router.pushReplacement(NotificationScreen.routePath);
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*.07 ,),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: AppColor.primary,
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 2), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:  const EdgeInsets.all(12),
                            child: Text("Get Started",style: GoogleFonts.poppins(color:  AppColor.primary ,fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right: 15.w),
                            child: Icon(Icons.arrow_forward,color:  AppColor.primary,size: 25),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*.2),
                Text("by continuing, you’re accepting our",style: GoogleFonts.poppins(fontSize: 12),),
                SizedBox(height:height*.005,),
                Text(" privacy policy & terms of service",style: GoogleFonts.poppins(fontSize:  12,fontWeight: FontWeight.w700),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}