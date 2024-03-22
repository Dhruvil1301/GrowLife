import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/auth/view/widgets/verificationscreen.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
class ForgotPassword extends ConsumerStatefulWidget {


  ForgotPassword({Key? key}) : super(key: key);
  static const routePath="/forgotpassword";

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  TextEditingController textcontroller=TextEditingController();

  final _formKey= GlobalKey<FormState>();

  final String  success="You want to forget Your password";
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    final forgotProvider=ref.read(forgotControllerProvider);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
                Container(
                  alignment: Alignment.center,
                    child: Image.asset(ImageAssets.verification,height:  MediaQuery.of(context).size.height*.50,width:  MediaQuery.of(context).size.width*.70,)),
              Text("Forgot Password",style: GoogleFonts.plusJakartaSans(fontSize: 24,fontWeight: FontWeight.w700),),
              SizedBox(height: MediaQuery.of(context).size.height*.015 ,),
              Text("Enter your phone number or \nthe email linked to your account",style: GoogleFonts.poppins(fontSize: 16 ,fontWeight: FontWeight.w400,),textAlign:TextAlign.center),
              SizedBox(height: MediaQuery.of(context).size.height*.025 ,),
              Text("Enter Email",style:GoogleFonts.poppins(fontSize: 16 ,fontWeight: FontWeight.w400,)),
              SizedBox(height: MediaQuery.of(context).size.height*.010 ,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.050 ),
                child: TextFormField(
                  controller: textcontroller ,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Required";
                    }
                    return null;
                  },
                ),
              ),
             SizedBox( height:MediaQuery.of(context).size.height*.08),
                   InkWell(

                     onTap: (){
                       setState(() {
                         isLoading=true;
                       });
                       Future.delayed(const Duration(seconds: 3), () {
                         setState(() {
                           isLoading = false;
                         });
                       });
                       if(_formKey.currentState!.validate()){
                         forgotProvider.forgot(context,textcontroller.text);
                       }
                     },
                child: Container(
                  height:MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.45,
                  decoration: BoxDecoration(
                      color:AppColor.blueButtonColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Center(child: isLoading==true?CircularProgressIndicator(color: Colors.black,):Text("Get OTP",style: GoogleFonts.plusJakartaSans(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
                ),
              )
            ],
          ),
        ),
      ),
    ),);
  }
}

