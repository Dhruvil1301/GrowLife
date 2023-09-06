import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/pages/forgotpasswordscreen.dart';
import 'package:growlife/pages/signupscreen.dart';
import 'package:growlife/pages/userdetailscreen.dart';
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
                  SizedBox(height:  MediaQuery.of(context).size.height*.05),
                  Container(
                      child: Image.asset("assets/images/Growlife.png",height: 70,width: 90,fit: BoxFit.fill,)),
                  SizedBox(height:  MediaQuery.of(context).size.height*.014),
                  Text('Welcome Back',style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  35),),
                  SizedBox(height:  MediaQuery.of(context).size.height*.015),
                  Text('Login to your  account',style: GoogleFonts.lato(fontSize: 18),),
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
                        SizedBox(height:  MediaQuery.of(context).size.height*.04),
                        TextFormField(
                          style: GoogleFonts.lato(),
                          controller: PasswordController,
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
                            else if(value.length<6){
                              return "Atleast 6 digit password";
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height*.01),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.05),
                    child: Container(
                      alignment: Alignment.topRight,
                        child: TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                        }, child: Text("Forgot Password ?",style: GoogleFonts.lato(color: Colors.red,fontSize:22 ),))),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height*.06 ),
                  InkWell(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserDetailScreen()));
                      }
                    },
                    child: Container(
                      height:  MediaQuery.of(context).size.height*.07,
                      width:   MediaQuery.of(context).size.width*.33,
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
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*.02),
                            child: Text("LOGIN",style: GoogleFonts.lato(color:  Color(0xFF1F588E),fontSize:  MediaQuery.of(context).size.height*.027,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*.015 ),
                            child: Icon(Icons.arrow_forward,color: Color(0xFF1F588E),size:  MediaQuery.of(context).size.height*.04),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height*.05),
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
                  SizedBox(height:  MediaQuery.of(context).size.height*.015),
                  Image.asset("assets/images/Icons.png",height:  MediaQuery.of(context).size.height*.04,),
                  SizedBox(height:  MediaQuery.of(context).size.height*.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",style: GoogleFonts.lato(fontSize:   MediaQuery.of(context).size.height*.022),),
                      TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));

                      }, child: Text("Sign up",style: GoogleFonts.lato(fontSize:   MediaQuery.of(context).size.height*.022)))
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