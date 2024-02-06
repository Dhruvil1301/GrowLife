import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/feature/profile/view/profile.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailScreen extends StatefulWidget {

  const UserDetailScreen({Key? key}) : super(key: key);
  static const routePath="/userdetailscreen";
  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();
  File? _image;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  bool _isUsernameValid = false;
  bool _isEmailValid = false;
  bool _isLocationValid = false;
  bool _isPhoneNumberValid = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
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
                        children: [
                          InkWell(
                            onTap: () {
                              router.pushReplacement(HomeScreen.routePath);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Skip',
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset(
                          ImageAssets.greencolor,
                          height: MediaQuery.of(context).size.height * .26,
                          width: MediaQuery.of(context).size.width * .55,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .18,
                          left: MediaQuery.of(context).size.height * .18,
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      .12,
                                  width: MediaQuery.of(context).size.width *
                                      .27,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: _image == null
                                        ? Image.asset(
                                      ImageAssets.profile,
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          .08,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .07,
                                    )
                                        : Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: MediaQuery.of(context).size.width *
                                      .22,
                                  top: MediaQuery.of(context).size.height *
                                      .095,
                                  child: InkWell(
                                    onTap: _showImageSourceDialog,
                                    child: Container(
                                      padding: EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        size:
                                        MediaQuery.of(context).size.height *
                                            .025,
                                      ),
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
                  SizedBox(
                      height: MediaQuery.of(context).size.height * .032),
                  _buildFormField(
                    "Username",
                    _usernameController,
                    TextInputType.text,
                        (value) {
                      setState(() {
                        _isUsernameValid = value.isNotEmpty;
                      });
                    },
                    _isUsernameValid
                        ? Icon(Icons.done, color: Colors.green)
                        : null,
                  ),
                  _buildFormField(
                    "Email",
                    _emailController,
                    TextInputType.emailAddress,
                        (value) {
                      setState(() {
                        _isEmailValid = value.isNotEmpty;
                      });
                    },
                    _isEmailValid
                        ? Icon(Icons.done, color: Colors.green)
                        : null,
                  ),
                  _buildFormField(
                    "Location",
                    _locationController,
                    TextInputType.text,
                        (value) {
                      setState(() {
                        _isLocationValid = value.isNotEmpty;
                      });
                    },
                    _isLocationValid
                        ? Icon(Icons.done, color: Colors.green)
                        : null,
                  ),
                  _buildFormField(
                    "Phone Number",
                    _phoneNumberController,
                    TextInputType.number,
                        (value) {
                      setState(() {
                        _isPhoneNumberValid = value.isNotEmpty;
                      });
                    },
                    _isPhoneNumberValid
                        ? Icon(Icons.done, color: Colors.green)
                        : null,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(image: _image,)));
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * .07,
                      width: MediaQuery.of(context).size.width * .7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: (_isUsernameValid &&
                            _isEmailValid &&
                            _isLocationValid &&
                            _isPhoneNumberValid)
                            ? AppColor.primary
                            : Colors.grey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Completed",
                          style: GoogleFonts.openSans(
                            fontSize: 29,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
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

  Widget _buildFormField(
      String labelText,
      TextEditingController controller,
      TextInputType keyboardType,
      Function(String) onChanged,
      Widget? suffixIcon,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.black45,
              fontSize: 20,
            ),
          ),
          TextFormField(
            controller: controller,
            style: GoogleFonts.poppins(),
            keyboardType: keyboardType,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "$labelText is required";
              }
              return null;
            },
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Future<void> _showImageSourceDialog() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Choose Image Source',
            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.folder),
                title: Text(
                  'Folder',
                  style: GoogleFonts.lato(),
                ),
                onTap: () {
                  _getImage(ImageSource.gallery); // Call _getImage when Folder is chosen.
                  Navigator.of(context).pop(); // Close the dialog.
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text(
                  'Camera',
                  style: GoogleFonts.lato(),
                ),
                onTap: () {
                  _getImage(ImageSource.camera); // Call _getImage when Camera is chosen.
                  Navigator.of(context).pop(); // Close the dialog.
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedImage = await _imagePicker.pickImage(source: source);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }
}
