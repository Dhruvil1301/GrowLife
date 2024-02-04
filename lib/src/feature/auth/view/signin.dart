import 'dart:async';
import 'dart:convert';
import 'package:growlife/src/feature/auth/view/signupscreen.dart';
import 'package:growlife/src/feature/auth/view/widgets/forgotpasswordscreen.dart';
import 'package:growlife/src/feature/auth/view/widgets/userverificationscreen.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey= GlobalKey<FormState>();
  TextEditingController UsernameorEmailController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();
  bool _showPassword = false;



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
  Future<void> signin( String email, String password,) async {
    final apiUrl = Uri.parse("https://uptight-shift-crow.cyclic.cloud/Users/v1/api/login");
    final Map<String, dynamic> data = {
      "Email": email,
      "password": password,
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
      Navigator.push(context,MaterialPageRoute(builder: (context)=>ShimmerScreenSuccess(email: UsernameorEmailController,)));

      print("Signin successful");
    } else {
      final jsonResponse = json.decode(response.body);
      final message = jsonResponse['message'];
      showErrorSnackbar(context, message);
      Navigator.push(context,MaterialPageRoute(builder: (context)=>const ShimmerScreen()));
      print("Signin failed: $message");
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
      final exit = await showExitConfirmationDialog(context);
      return exit ?? false;
      },
      child: SafeArea(
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const GoToForgetPassword()));
                        }, child: Text("Forgot Password ?",style: GoogleFonts.poppins(color: Colors.red,fontSize:14,fontWeight: FontWeight.w300),))),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height*.03),
                  InkWell(
                    onTap: (){
                      if(_formKey.currentState!.validate()){

                       signin(UsernameorEmailController.text, PasswordController.text);

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
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.029 ),
                        child: Row(
                          children: [
                            Text("LOGIN",style:GoogleFonts.poppins(color:  AppColor.primary,fontSize:  18,fontWeight: FontWeight.w400),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*.03,),
                             Icon(Icons.arrow_forward,color: AppColor.primary,size:  25),
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
                  SizedBox(height:  MediaQuery.of(context).size.height*.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w400 ),),
                      TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const GoToSignUp()));

                      }, child: Text("Sign up",style:GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.w300 ),))
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
  Future showExitConfirmationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Exit",style: GoogleFonts.lato(),),
          content: Text("Are you sure you want to exit the app?",style: GoogleFonts.lato(),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return false to cancel the exit
              },
              child: Text("No",style: GoogleFonts.lato(),),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop(); // Return true to confirm the exit
              },
              child: Text("Yes",style: GoogleFonts.lato(),),
            ),
          ],
        );
      },
    );
  }}


class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
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
                          height: MediaQuery.of(context).size.height*.06 ,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green.shade100,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*.02,),
                        Container(
                          height: MediaQuery.of(context).size.height*.06 ,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green.shade100,
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
class ShimmerScreenSuccess extends StatefulWidget {
  final TextEditingController email;
  const ShimmerScreenSuccess({Key? key, required this.email}) : super(key: key);

  @override
  State<ShimmerScreenSuccess> createState() => _ShimmerScreenSuccessState();
}

class _ShimmerScreenSuccessState extends State<ShimmerScreenSuccess> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set a timer for 3 seconds to pop the screen
    _timer = Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const GoToUserdetails()));
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
class GoToForgetPassword extends StatefulWidget {
  const GoToForgetPassword({Key? key}) : super(key: key);

  @override
  State<GoToForgetPassword> createState() => _GoToForgetPasswordState();
}

class _GoToForgetPasswordState extends State<GoToForgetPassword> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set a timer for 3 seconds to pop the screen
    _timer = Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ForgotPassword()));
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
      child: Shimmer.fromColors(
        baseColor: Colors.blue.withOpacity(.2),
        highlightColor: Colors.blue.withOpacity(.1),
          child: Container(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.08 ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.07 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Container(
                        height: MediaQuery.of(context).size.height*.07 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.07 ,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.03,),
                      Container(
                        height: MediaQuery.of(context).size.height*.02 ,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.4,),
                      Container(
                        height: MediaQuery.of(context).size.height*.07 ,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100,
                        ),
                      ),
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

class GoToSignUp extends StatefulWidget {
  const GoToSignUp({Key? key}) : super(key: key);

  @override
  State<GoToSignUp> createState() => _GoToSignUpState();
}

class _GoToSignUpState extends State<GoToSignUp> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set a timer for 3 seconds to pop the screen
    _timer = Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
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
        child:Padding(
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
