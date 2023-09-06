import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/Navigationobjects/Home/Home.dart';
import 'package:growlife/main.dart';
import 'package:growlife/screen/homescreen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '';

import 'package:provider/provider.dart';

import '../user/edituserdetails.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  final _formKey= GlobalKey<FormState>();
  File? file;
  ImagePicker image = ImagePicker();
  TextEditingController UsernameController=TextEditingController();
  TextEditingController EmailController=TextEditingController();
  TextEditingController LocationController=TextEditingController();
  TextEditingController PhoneNumberController=TextEditingController();
  bool isUsernameValid = false;
  bool isEmailValid = false;
  bool isLocationValid = false;
  bool isPhoneNumberValid = false;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(

            child: Form(
              key: _formKey,
                child: Column(
                  children: [

                       Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Padding(
                                 padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.0330,bottom: MediaQuery.of(context).size.height*.12),
                                 child: InkWell(
                                   onTap: (){
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomeScreen()));
                                   },
                                     child: Text('Skip',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black45,fontSize: MediaQuery.of(context).size.height*.025),)),
                               ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Image.asset("assets/images/greencolor.png",height:MediaQuery.of(context).size.height*.26,width: MediaQuery.of(context).size.width*.55,),
                              ),
                            ],
                          ),

                          Padding(
                            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.18,left: MediaQuery.of(context).size.height*.18),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height*.12,
                                        width: MediaQuery.of(context).size.width*.27,
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        child:ClipRRect(
                                          borderRadius: BorderRadius.circular(40),
                                        child: Provider.of<CustomImageProvider>(context).image==null
                                            ? Image.asset("assets/images/profile.png",height: MediaQuery.of(context).size.height*.08,width: MediaQuery.of(context).size.width*.07,)
                                            :  Image(image: FileImage(Provider.of<CustomImageProvider>(context).image!),fit: BoxFit.cover,)
                                      ),
                                      ),
                                      Positioned(
                                        left: MediaQuery.of(context).size.width*.22,
                                        top: MediaQuery.of(context).size.height*.095,
                                        child: InkWell(
                                          onTap: () {
                                            _showImageSourceDialog(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Icon(Icons.camera_alt_outlined,size: MediaQuery.of(context).size.height*.025,),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    SizedBox(height: MediaQuery.of(context).size.height*.032),
                    Padding(
                      padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.3),
                      child: Text("Username",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black45,fontSize: MediaQuery.of(context).size.height*.025),),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 0,horizontal: MediaQuery.of(context).size.width*.07),
                      child: TextFormField(
                          controller: UsernameController,
                         style: GoogleFonts.lato(),
                         decoration: InputDecoration(
                           suffixIcon: isUsernameValid
                               ? Icon(Icons.done, color: Colors.green)
                               : null,
                         ),

                        validator: (value){
                          if(value!.isEmpty){
                            return "Username is required";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            isUsernameValid = value.isNotEmpty;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.022),
                    Padding(
                      padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.35),
                      child: Text("Email",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black45,fontSize:  MediaQuery.of(context).size.height*.025),),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 0,horizontal:MediaQuery.of(context).size.width*.063 ),
                      child: TextFormField(
                        controller: EmailController,
                        style: GoogleFonts.lato(),
                        decoration: InputDecoration(
                          suffixIcon: isEmailValid
                              ? Icon(Icons.done, color: Colors.green)
                              : null,
                        ),

                        validator: (value){
                          if(value!.isEmpty){
                            return "Email is required";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            isEmailValid = value.isNotEmpty;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.022 ),
                    Padding(
                      padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.32 ),
                      child: Text("Location",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black45,fontSize:  MediaQuery.of(context).size.height*.025),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0,horizontal: MediaQuery.of(context).size.width*.06),
                      child: TextFormField(
                        controller: LocationController,
                        style: GoogleFonts.lato(),
                        decoration: InputDecoration(
                          suffixIcon: isLocationValid
                              ? Icon(Icons.done, color: Colors.green)
                              : null,
                        ),

                        validator: (value){
                          if(value!.isEmpty){
                            return "Email is required";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            isLocationValid = value.isNotEmpty;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.022),
                    Padding(
                      padding:  EdgeInsets.only(right:  MediaQuery.of(context).size.height*.258),
                      child: Text("Phone Number",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black45,fontSize:  MediaQuery.of(context).size.height*.025),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0,horizontal: MediaQuery.of(context).size.width*.06),
                      child: TextFormField(
                        controller: PhoneNumberController,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.lato(),
                        decoration: InputDecoration(
                          suffixIcon: isPhoneNumberValid
                              ? Icon(Icons.done, color: Colors.green)
                              : null,
                        ),

                        validator: (value){
                          if(value!.isEmpty){
                            return "Phone Number is required";
                          }
                          else if(value.length<10){
                            return "Invaild phone number";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            isPhoneNumberValid = value.isNotEmpty;
                          });
                        },
                      ),
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.05,),
                    InkWell(
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                        }
                      },
                      child: Container(
                        height:  MediaQuery.of(context).size.height*.08,
                        width:  MediaQuery.of(context).size.width*.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: (isUsernameValid&&isEmailValid&&isLocationValid&&isPhoneNumberValid)?Color(0xFF1F588E):Colors.grey,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes the position of the shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text("Completed",style: GoogleFonts.lato(fontSize:  MediaQuery.of(context).size.height*.035,fontWeight: FontWeight.bold,color: Colors.white),),
                        ),

                      ),
                    )
                  ],
                ),

            ),
          ),
        ),
      ),
    );
  }

  getcam() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      Provider.of<CustomImageProvider>(context, listen: false).setImage(File(img!.path));
    });
  }

  getgall() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      Provider.of<CustomImageProvider>(context, listen: false).setImage(File(img!.path));
    });
  }

  Future<void> _showImageSourceDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Image Source',style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.folder),
                title: Text('Folder',style: GoogleFonts.lato(),),
                onTap: () {
                  getgall(); // Call getgall() when Folder is chosen.
                  Navigator.of(context).pop(); // Close the dialog.
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera',style: GoogleFonts.lato(),),
                onTap: () {
                  getcam(); // Call getcam() when Camera is chosen.
                  Navigator.of(context).pop(); // Close the dialog.
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
