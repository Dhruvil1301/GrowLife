import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/pages/Signin.dart';
import 'package:growlife/pages/welcomescreen.dart';
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
                    SizedBox(height:  MediaQuery.of(context).size.height*.015),
                    Container(
                        child: Image.asset("assets/images/Growlife.png",height:  MediaQuery.of(context).size.height*.10,width:  MediaQuery.of(context).size.width*.25,fit: BoxFit.fill,)),
                    SizedBox(height:  MediaQuery.of(context).size.height*.012),
                    Text('Sign Up',style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.04),),
                    SizedBox(height:  MediaQuery.of(context).size.height*.016),
                    Text('Create your new account',style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.026),),
                    SizedBox(height:  MediaQuery.of(context).size.height*.03),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.093),
                      child: TextFormField(
                        style: GoogleFonts.lato(),
                        controller:emailController ,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.023,fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
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
                    SizedBox(height:  MediaQuery.of(context).size.height*.018),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.093,),
                      child: TextFormField(
                        style: GoogleFonts.lato(),
                        controller:usernameController ,
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.023,fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
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
                    SizedBox(height:  MediaQuery.of(context).size.height*.018),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.093),
                      child: TextFormField(
                        style: GoogleFonts.lato(),
                        controller: passwordController,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.023),
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
                    SizedBox(height:  MediaQuery.of(context).size.height*.018),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.093),
                      child: TextFormField(
                        style: GoogleFonts.lato(),
                        controller: confirmpasswordController,
                        obscureText: !_showConfirmPassword,
                        decoration: InputDecoration(

                            hintText: "Confirm Password",
                            hintStyle: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  MediaQuery.of(context).size.height*.023),
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
                    SizedBox(height:  MediaQuery.of(context).size.height*.018),
                    InkWell(
                      onTap: (){
                            if(_formKey.currentState!.validate()){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

                      }
                      },
                      child: Container(
                        height:  MediaQuery.of(context).size.height*.07,
                        width:   MediaQuery.of(context).size.width*.34,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFF1F588E),
                              width: 1.0,
                            ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes the position of the shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*.008),
                              child: Text("SIGN UP",style: GoogleFonts.lato(color:  Color(0xFF1F588E),fontSize:  MediaQuery.of(context).size.height*.025,fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(right:  MediaQuery.of(context).size.width*.015),
                              child: Icon(Icons.arrow_forward,color: Color(0xFF1F588E),size:  MediaQuery.of(context).size.height*.04),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.02),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*.001,
                          width:  MediaQuery.of(context).size.width*.16,
                          color: Colors.black,
                        ),
                        SizedBox(width:  MediaQuery.of(context).size.height*.02),
                        Text('or continue with',style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.022),),
                        SizedBox(width: MediaQuery.of(context).size.height*.02),
                        Container(
                          height:  MediaQuery.of(context).size.height*.001,
                          width:  MediaQuery.of(context).size.width*.16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.013),
                    Image.asset("assets/images/Icons.png",height:  MediaQuery.of(context).size.height*.035,width:  MediaQuery.of(context).size.width*.4),
                    SizedBox(height:  MediaQuery.of(context).size.height*.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Already have an account?",style: GoogleFonts.lato(fontSize:   MediaQuery.of(context).size.height*.022),),
                        TextButton(onPressed: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

                        }, child: Text("Sign in",style: GoogleFonts.lato(fontSize:   MediaQuery.of(context).size.height*.022)))
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
