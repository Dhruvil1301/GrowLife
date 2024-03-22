import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/auth/view/signin.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:http/http.dart' as http;

class NewPassword extends ConsumerStatefulWidget {


  const NewPassword({Key? key,}) : super(key: key);
  static const routePath="/newPassword";
  @override
  ConsumerState<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends ConsumerState<NewPassword> {

  final _formKey= GlobalKey<FormState>();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword=false;
  bool isLoading=false;






  @override
  Widget build(BuildContext context) {
  final createProvider=ref.read(createPasswordProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(ImageAssets.verification,
                      height: MediaQuery.of(context).size.height * .35,
                      width: MediaQuery.of(context).size.width * .60),
                ),
                Text(
                  "Enter New Password",
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .015),

                SizedBox(height: MediaQuery.of(context).size.height * .03),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 35.w),
                  child: TextFormField(
                    style: GoogleFonts.lato(),
                    controller: passwordController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                        hintText: 'Enter New Password',
                        hintStyle: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  16.sp),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                        suffixIcon: IconButton(
                          icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.black
                          ),
                        )
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your password";
                      }
                      if(value.length<6){
                        return "Atleast 6 digit password";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(height:MediaQuery.of(context).size.height*.02 ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  35.w),
                  child: TextFormField(
                    style: GoogleFonts.lato(),
                    controller: confirmpasswordController,
                    obscureText: !_showConfirmPassword,
                    decoration: InputDecoration(

                        hintText: "Confirm Password",
                        hintStyle: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  16.sp),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                        suffixIcon: IconButton(
                          icon: Icon(_showConfirmPassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _showConfirmPassword = !_showConfirmPassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.black
                          ),
                        )
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter your password";
                      }
                      else if(value!=passwordController.text){
                        return "Password does not match";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.04),
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
                     createProvider.createPassword(context, passwordController.text, confirmpasswordController.text);
                    }
                  },
                  child: Container(
                    height:MediaQuery.of(context).size.height*.06,
                    width: MediaQuery.of(context).size.width*.45,
                    decoration: BoxDecoration(
                      color: Color(0xFF5ED6EA),
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
                    child: Center(child: isLoading==true?CircularProgressIndicator(color: Colors.black,): Text("Continue",style: GoogleFonts.plusJakartaSans(color: Colors.black,fontWeight: FontWeight.bold,fontSize:18))),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}