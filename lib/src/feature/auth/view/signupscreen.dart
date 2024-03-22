

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/auth/controller/signup_controller.dart';
import 'package:growlife/src/feature/auth/view/signin.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';
import 'package:http/http.dart' as http;

import 'package:shimmer/shimmer.dart';
class SignUpScreen extends ConsumerStatefulWidget {

  const SignUpScreen({Key? key}) : super(key: key);
  static const routePath="/signup";



  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey= GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword=false;
  bool isLoading=false;


  @override
  Widget build(BuildContext context) {
    final signUpController = ref.read(signUpControllerProvider);
    return WillPopScope (
      onWillPop: ()async{
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body:

            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height:  MediaQuery.of(context).size.height*.01),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Row(
                        children: [
                          Container(
                              child: Image.asset(ImageAssets.growlife,height: 30.h,fit: BoxFit.fill,)),
                          Image.asset(ImageAssets.growlifeText,height:18.h ,)
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text('Sign Up',style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700,fontSize:32),),
                    SizedBox(height:  5.h),
                    Text('Create your new account',style: GoogleFonts.poppins(fontSize: 18),),
                    SizedBox(height: 15.h),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:  35.w),
                      child: TextFormField(
                        style: GoogleFonts.lato(),
                        controller:emailController ,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: GoogleFonts.lato(fontSize:  16.sp,fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),

                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please enter your email";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height:  15.h),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:  35.w,),
                      child: TextFormField(
                        style: GoogleFonts.lato(),
                        controller:usernameController ,
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: GoogleFonts.lato(fontSize:  16.sp,fontWeight: FontWeight.bold),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),

                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Username is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height:  15.h),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 35.w),
                      child: TextFormField(
                        style: GoogleFonts.lato(),
                        controller: passwordController,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
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
                            borderSide: const BorderSide(
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
                    SizedBox(height: 15.h),
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
                              borderSide: const BorderSide(
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
                    SizedBox(height: 25.h),
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
                        if (_formKey.currentState!.validate()) {
                          signUpController.signUp(
                            context,
                            emailController.text,
                            usernameController.text,
                            passwordController.text,
                            confirmpasswordController.text
                          );
                        }
                      },
                      child: Container(
                        height:  50.h,
                        width:  150.w,
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
                        child: isLoading==true?const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primary,
                          ),
                        ):Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(

                            children: [
                              Text("SIGN UP",style: GoogleFonts.poppins(color:  AppColor.primary,fontSize:  18,fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width:12.w,),
                              const Icon(Icons.arrow_forward,color: AppColor.primary,size:  25),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:  15.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1.h,
                          width:  60.w,
                          color: Colors.black,
                        ),
                        SizedBox(width:  18.w),
                        Text('or continue with',style: GoogleFonts.poppins(fontSize:  16,fontWeight: FontWeight.w300),),
                        SizedBox(width: 18.w),
                        Container(
                          height:  1.h,
                          width:  60.w,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height:  18.h),
                    Container(
                      height:  40.h,
                      width:   280.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 2), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w ),
                        child: Row(
                          children: [
                               Image.asset(ImageAssets.googlelogo,height:25.h ,),
                               SizedBox(width:18.w ,),
                               Text("Sign up with Google",style: GoogleFonts.poppins(fontSize:18,fontWeight: FontWeight.w400 ),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:  8.h),
                    Container(
                      height:  40.h,
                      width:   280.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 2), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal:12.w  ),
                        child: Row(
                          children: [
                            Image.asset(ImageAssets.facebooklogo,height:25.h ,),
                            SizedBox(width:18.w  ,),
                            Text("Sign up with Facebook",style:  GoogleFonts.poppins(fontSize:18,fontWeight: FontWeight.w400 ),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height:  40.h,
                      width:   280.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 2), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w ),
                        child: Row(
                          children: [
                            Image.asset(ImageAssets.applelogo,height:25.h ,),
                            SizedBox(width:18.w  ,),
                            Text("Sign up with Apple",style:  GoogleFonts.poppins(fontSize:18,fontWeight: FontWeight.w400 ),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:  8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Already have an account?",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w400 ),),
                        TextButton(onPressed: (){
                          router.pushReplacement(SignInScreen.routePath);

                        }, child: Text("Sign in",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w300 ),))
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}

