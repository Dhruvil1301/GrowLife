import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/feature/profile/controller/uploadprofileimage_controller.dart';
import 'package:growlife/src/feature/profile/repo/uploadprofileimage_repo.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailScreen extends ConsumerStatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);
  static const routePath = "/userdetailscreen";

  @override
  ConsumerState<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends ConsumerState<UserDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();
  File? _image;
  TextEditingController ?usernameController;
  TextEditingController ?emailController;
  TextEditingController ?locationController;
  TextEditingController ?phoneNumberController;
  String profile =
      "https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg";
  bool _isUsernameValid = false;
  bool _isEmailValid = false;
  bool _isLocationValid = false;
  bool _isPhoneNumberValid = false;
  late ImageUploadController _imageUploadController;

  late String fetchedUsername;
  late String fetchedEmail;
  late String fetchedLocation;
  late String fetchedPhoneNumber;

  @override
  void initState() {
    super.initState();
    _imageUploadController = ImageUploadController();
    super.initState();
    _imageUploadController = ImageUploadController();
  }



  @override
  Widget build(BuildContext context) {
    final userDetailsState = ref.watch(userControllerProvider);
    userDetailsState.when(
      data: (data) {
        usernameController ??= TextEditingController(text: data['username'] ?? "");
        emailController ??= TextEditingController(text: data['email'] ?? "");
        locationController ??= TextEditingController(text: data['location'] ?? "");
        phoneNumberController ??= TextEditingController(text: data['phone']?.toString() ?? "");
        profile = data['profilePic'];
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
    );
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
                                        ? Image.network(
                                      profile,
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
                                      padding: const EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: MediaQuery.of(context).size.height *
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
                    usernameController!,
                    TextInputType.text,
                        (value) {
                      setState(() {
                        _isUsernameValid = value.isNotEmpty;
                        fetchedUsername=value;
                      });
                    },
                    _isUsernameValid
                        ? const Icon(Icons.done, color: Colors.green)
                        : null,
                  ),
                  _buildFormField(
                    "Email",
                    emailController!,
                    TextInputType.emailAddress,
                        (value) {
                      setState(() {
                        _isEmailValid = value.isNotEmpty;
                        fetchedEmail=value;
                      });
                    },
                    _isEmailValid
                        ? const Icon(Icons.done, color: Colors.green)
                        : null,
                  ),
                  _buildFormField(
                    "Location",
                    locationController!,
                    TextInputType.text,
                        (value) {
                      setState(() {
                        _isLocationValid = value.isNotEmpty;
                        fetchedPhoneNumber = value;
                      });
                    },
                    _isLocationValid
                        ? const Icon(Icons.done, color: Colors.green)
                        : null,
                  ),
                  _buildFormField(
                    "Phone Number",
                    phoneNumberController!,
                    TextInputType.number,
                        (value) {
                      setState(() {
                        _isPhoneNumberValid = value.isNotEmpty;
                        fetchedPhoneNumber=value;
                      });
                    },
                    _isPhoneNumberValid
                        ? const Icon(Icons.done, color: Colors.green)
                        : null,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * .05),
                  Consumer(
                    builder: (context, ref, child) {
                      final imageUploadState =
                      ref.read(uploadFileRepositoryProvider);
                      return InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final userDetails = {
                              'username': usernameController!.text,
                              'email': emailController!.text,
                              'phone': phoneNumberController!.text,
                              'location': locationController!.text,
                            };
                            ref.read(userDetailsProvider.notifier)
                                .updateUserDetails(emailController!.text,userDetails);
                            if (!imageUploadState.isUploading) {
                              bool uploaded =
                              await _imageUploadController.uploadImage(
                                _image!,
                              );
                              if (uploaded) {
                                // Proceed with other operations after successful image upload.
                              } else {
                                // Handle failed image upload.
                              }
                            } else {
                              // Show a message indicating that an upload is already in progress.
                            }
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
                                _isPhoneNumberValid &&
                                !imageUploadState.isUploading)
                                ? AppColor.primary
                                : Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.9),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
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
                      );
                    },
                  ),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                leading: const Icon(Icons.folder),
                title: Text(
                  'Folder',
                  style: GoogleFonts.lato(),
                ),
                onTap: () {
                  _getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: Text(
                  'Camera',
                  style: GoogleFonts.lato(),
                ),
                onTap: () {
                  _getImage(ImageSource.camera);
                  Navigator.of(context).pop();
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
