import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/auth/view/signupscreen.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
class NotificationScreen extends StatefulWidget {

  const NotificationScreen({Key? key}) : super(key: key);
  static const routePath="/permission";
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context){
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
                    SizedBox(height: height*.06),
                    Image.asset(ImageAssets.growlife,height: 80.h,width: 100.w,fit: BoxFit.fill,),
                    SizedBox(height:  20.h,),
                    Image.asset(ImageAssets.growlifeText,height:25.h,),
                    SizedBox(height:  60.h,),
                    Center(
                      child: Padding(
                       padding: EdgeInsets.symmetric(horizontal: width*.08),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.sp),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.9),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3), // changes the position of the shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height:  12.h,),
                              Image.asset(ImageAssets.notification,height:  30.h,width: 30.w,),
                              SizedBox(height:  12.h,),
                              Text("Allow “GrowLife” to send",style: GoogleFonts.poppins(fontSize:18 ,fontWeight: FontWeight.w600),),
                              Text("you notifications?",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600)),
                              SizedBox(height: height*.05),
                              Container(
                                height:1.h,
                                width: 310.w,
                                color:  AppColor.primary,
                              ),
                              Row(
                                children: [
                                  SizedBox(width:60.w),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                                    },
                                      child: Text("ALLOW",style:GoogleFonts.poppins(color: AppColor.primary,fontWeight: FontWeight.w500,fontSize:  16) ,)),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 25.w,right:25.w ),
                                    child: Container(
                                      height: 54.h,
                                      width: 1.w,
                                      color:  AppColor.primary,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.w ),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                                      },
                                        child: Text("DON'T ALLOW",style:GoogleFonts.poppins(color: AppColor.primary,fontWeight: FontWeight.w500,fontSize:  16)) ),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:height*.32),
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
