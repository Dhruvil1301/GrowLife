import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/auth/view/signupscreen.dart';
import 'package:growlife/src/feature/auth/view/widgets/forgotpasswordscreen.dart';
import 'package:growlife/src/feature/auth/view/widgets/emailverification.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class SignInScreen extends ConsumerStatefulWidget {

  const SignInScreen({Key? key}) : super(key: key);
  static const routePath="/signin";
  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey= GlobalKey<FormState>();
  TextEditingController UsernameorEmailController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();
  bool _showPassword = false;
  bool isLoading=false;






  @override
  Widget build(BuildContext context) {
    final signInController = ref.read(signInControllerProvider);
    return
       SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body:SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height:  MediaQuery.of(context).size.height*.02),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.01 ),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Row(
                        children: [
                          Container(
                              child: Image.asset(ImageAssets.growlife,height:  MediaQuery.of(context).size.height*.05,fit: BoxFit.fill,)),
                          Image.asset(ImageAssets.growlifeText,height:MediaQuery.of(context).size.height*.02 ,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height*.04),
                  Text('Welcome Back',style: GoogleFonts.plusJakartaSans(fontSize:  32,fontWeight: FontWeight.w700)),
                  SizedBox(height:  MediaQuery.of(context).size.height*.012),
                  Text('Login to your  account',style:GoogleFonts.poppins(fontSize:  18,fontWeight: FontWeight.w400)),
                  SizedBox(height:  MediaQuery.of(context).size.height*.05),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.093),
                    child: Column(
                      children: [
                           TextFormField(
                            style: GoogleFonts.lato(),
                            controller:UsernameorEmailController ,
                            decoration: InputDecoration(
                              hintText: "Username or Email",
                              hintStyle: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.021,fontWeight: FontWeight.bold),
                              contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02 ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return "Email is required";
                              }
                              return null;
                            },
                          ),
                        SizedBox(height:  MediaQuery.of(context).size.height*.03),
                        TextFormField(
                          style: GoogleFonts.lato(),
                          controller: PasswordController,
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.021),
                              contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02 ),
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
                            else if(value.length<6){
                              return "Atleast 6 digit password";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height*.005),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.05),
                    child: Container(
                      alignment: Alignment.topRight,
                        child: TextButton(onPressed: (){
                          router.push(ForgotPassword.routePath);
                        }, child: Text("Forgot Password ?",style: GoogleFonts.poppins(color: Colors.red,fontSize:14,fontWeight: FontWeight.w300),))),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height*.03),
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
                       signInController.signin(
                           context,
                           UsernameorEmailController.text,
                           PasswordController.text);


                      }
                    },
                    child: Container(
                      height:  MediaQuery.of(context).size.height*.06,
                      width:   MediaQuery.of(context).size.width*.4,
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
                      child: isLoading==true?const Center(child: CircularProgressIndicator(color: AppColor.primary,)):Padding(
                        padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.029 ),
                        child: Row(
                          children: [
                            Text("LOGIN",style:GoogleFonts.poppins(color:  AppColor.primary,fontSize:  18,fontWeight: FontWeight.w400),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*.03,),
                             const Icon(Icons.arrow_forward,color: AppColor.primary,size:  25),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height*.04),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.0015,
                        width:  MediaQuery.of(context).size.width*.16,
                        color: Colors.black,
                      ),
                      SizedBox(width:  MediaQuery.of(context).size.height*.02),
                      Text('or continue with',style: GoogleFonts.poppins(fontSize:  16,fontWeight: FontWeight.w300)),
                      SizedBox(width: MediaQuery.of(context).size.height*.02),
                      Container(
                        height:  MediaQuery.of(context).size.height*.0015,
                        width:  MediaQuery.of(context).size.width*.16,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height*.025),
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
                  SizedBox(height:  MediaQuery.of(context).size.height*.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w400 ),),
                      TextButton(onPressed: (){
                         router.push(SignUpScreen.routePath);

                      }, child: Text("Sign up",style:GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w300 ),))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }

  }



