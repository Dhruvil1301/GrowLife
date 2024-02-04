import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/auth/view/signin.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shimmer/shimmer.dart';
class SignUpScreen extends StatefulWidget {

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey= GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword=false;
  void showSuccessSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating, // Optional: You can choose how the snackbar behaves
      duration: const Duration(seconds: 3),
      padding: EdgeInsets.all(15.sp),
      content: Text(message,style: GoogleFonts.lato(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.bold),),
      backgroundColor: Colors.green,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorSnackbar(BuildContext context, String errorMessage) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating, // Optional: You can choose how the snackbar behaves
      duration: const Duration(seconds: 3),
      content: Text(errorMessage,style: GoogleFonts.lato(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.bold),),
      backgroundColor: Colors.red,
      padding: EdgeInsets.all(15.sp),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  Future<void> signup(String username, String email, String password,String Confirmpassword) async {
    final apiUrl = Uri.parse("https://uptight-shift-crow.cyclic.cloud/Users/v1/api/SignUp");
    final Map<String, dynamic> data = {
      "Username": username,
      "Email": email,
      "password": password,
      "passwordConfirm": Confirmpassword,
    };
    final Map<String, String> headers = {
      'Content-Type': 'application/json', // Assuming 'Content-Type' is 'application/json'

    };
      // Other headers if required
    final String jsonData = json.encode(data);

    final response = await http.post(
      apiUrl,
      headers: headers,
      body: jsonData
    );

    if (response.statusCode == 200) {
      // Successful signup, you can handle the response here
      final jsonResponse = json.decode(response.body);
      final message = jsonResponse['message'];

      showSuccessSnackbar(context, message);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ShimmerScreenSuccessSignup()));
      print("Signup successful");
    } else {
      final jsonResponse = json.decode(response.body);
      final message = jsonResponse['message'];
      showErrorSnackbar(context, message);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ShimmerScreenSignup()));
      print("Signup failed: $message");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                            if(_formKey.currentState!.validate()){
                          signup(usernameController.text, emailController.text, passwordController.text, confirmpasswordController.text);
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
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(

                            children: [
                              Text("SIGN UP",style: GoogleFonts.poppins(color:  AppColor.primary,fontSize:  18,fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width:12.w,),
                              Icon(Icons.arrow_forward,color: const Color(0xFF1F588E),size:  25),
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
                               Text("Sign up with Google",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w400 ),)
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
                            Text("Sign up with Facebook",style:  GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w400 ),)
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
                            Text("Sign up with Apple",style:  GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w400 ),)
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

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ShimmerScreenSuccessSignup()));

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
class ShimmerScreenSignup extends StatefulWidget {
  const ShimmerScreenSignup({Key? key}) : super(key: key);

  @override
  State<ShimmerScreenSignup> createState() => _ShimmerScreenSignupState();
}

class _ShimmerScreenSignupState extends State<ShimmerScreenSignup> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set a timer for 3 seconds to pop the screen
    _timer = Timer(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.1 ),
        child: Shimmer.fromColors(
          baseColor:Colors.blue.withOpacity(.2),
          highlightColor: Colors.blue.withOpacity(.1),
          child: Container(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.03 ),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.04 ,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.04 ,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.07 ,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.01 ,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.01,),
                      Container(
                        height: MediaQuery.of(context).size.height*.01 ,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.01,),
                      Container(
                        height: MediaQuery.of(context).size.height*.01 ,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.01,),
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
class ShimmerScreenSuccessSignup extends StatefulWidget {
  const ShimmerScreenSuccessSignup({Key? key}) : super(key: key);

  @override
  State<ShimmerScreenSuccessSignup> createState() => _ShimmerScreenSuccessSignupState();
}

class _ShimmerScreenSuccessSignupState extends State<ShimmerScreenSuccessSignup> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set a timer for 3 seconds to pop the screen
    _timer = Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();}
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.1 ),
        child: Shimmer.fromColors(
          baseColor: Colors.blue.withOpacity(.2),
          highlightColor: Colors.blue.withOpacity(.1),
          child: Container(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.03 ),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.04 ,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.04 ,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.06 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.07 ,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.01 ,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.01,),
                      Container(
                        height: MediaQuery.of(context).size.height*.01 ,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.01,),
                      Container(
                        height: MediaQuery.of(context).size.height*.01 ,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.01,),
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
