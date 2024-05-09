import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/profile/controller/uploadprofileimage_controller.dart';
import 'package:growlife/src/feature/profile/view/profile.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
class EditProfile extends ConsumerStatefulWidget {

  const EditProfile({Key? key,}) : super(key: key);
  static const routePath="/editprofile";
  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  TextEditingController? nameController;
  TextEditingController? usernameController;
  TextEditingController? emailController;
  TextEditingController? locationController;
  TextEditingController? phoneNumberController;
  TextEditingController? bioController;
  final ImagePicker _imagePicker = ImagePicker();
  String profile =
      "https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg";
  File? _image;
  String ?typeValue;
  late ImageUploadController _imageUploadController;
  String getGenderLabel(String value) {
    if (value == '1') {
      return 'Male';
    } else if (value == '2') {
      return 'Female';
    } else {
      return '';
    }
  }


  @override
  void initState() {
    super.initState();
    _imageUploadController = ImageUploadController();
  }

  @override
  Widget build(BuildContext context) {
    final userDetailsState = ref.watch(userControllerProvider);
    final imageUploadState =
    ref.read(uploadFileRepositoryProvider);
    userDetailsState.when(
      data: (data) {
        nameController ??= TextEditingController(text: data['name'] != null ? data['name'] as String : "");
        usernameController ??= TextEditingController(text: data['username'] != null ? data['username'] as String : "");
        emailController ??= TextEditingController(text: data['email'] != null ? data['email'] as String : "");
        locationController ??= TextEditingController(text: data['location']!= null ? data['location'] as String : "" );
        phoneNumberController ??= TextEditingController(text: data['phone']!= null ? data['phone'].toString() : "");
        bioController ??= TextEditingController(text: data['bio'] != null ? data['bio'] as String : "");
        profile = data['profilePic']!= null ? data['profilePic'] as String : profile;
        typeValue = data['gender'] != null ? (data['gender'] == "Male" ? '1' : '2') : '1';
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(title: 'Edit Profile',
        action: [
          InkWell(
            onTap: () async{
              ref.refresh(userControllerProvider);
              final userDetails = {
                'name':nameController!.text,
                'username': usernameController!.text,
                'email': emailController != null ? emailController!.text : '', // Check if emailController is not null
                'phone': phoneNumberController!.text,
                'location': locationController!.text,
                'bio':bioController!.text,
                'gender': getGenderLabel(typeValue!),
              };
              ref.read(userDetailsProvider.notifier)
                  .updateUserDetails(emailController != null ? emailController!.text: '', userDetails);
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
            },
            child: Text("Update", style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColor.primary),),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery
                    .of(context)
                    .size
                    .height * .03),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .1,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .24,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: _image == null ? Image.network(
                              profile
                          )
                              : Image.file(
                            _image!, height: MediaQuery
                              .of(context)
                              .size
                              .height * .08, width: MediaQuery
                              .of(context)
                              .size
                              .width * .07,)
                      ),
                    ),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * .02,),
                    InkWell(
                        onTap: () {
                          _showImageSourceDialog();
                        },
                        child: Text("Edit Picture",
                          style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColor.primary),))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name", style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.black45,
                        fontSize: 20),),
                    TextFormField(
                      controller: nameController,
                      style: GoogleFonts.lato(),
                      decoration: const InputDecoration(

                      ),


                    ),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * .022),
                    Text("Username", style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.black45,
                        fontSize: 20),),
                    TextFormField(
                      controller: usernameController,
                      style: GoogleFonts.lato(),
                      decoration: const InputDecoration(

                      ),


                    ),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * .022),
                    Text("Bio", style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.black45,
                        fontSize: 20),),
                    TextFormField(
                      controller: bioController,
                      style: GoogleFonts.lato(),
                      decoration: const InputDecoration(

                      ),


                    ),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * .022),
                    Text("Gender", style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.black45,
                        fontSize: 20),),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * .022),
                    DropdownButtonFormField<String>(
                      value: typeValue, // Set the initial value to the fetched gender
                      items: [
                        DropdownMenuItem(value: '1', child: Text("Male", style: GoogleFonts.poppins())),
                        DropdownMenuItem(value: '2', child: Text("Female", style: GoogleFonts.poppins())),
                      ],
                      onChanged: (value) {
                        setState(() {
                          typeValue = value as String?;
                        });
                      },
                      decoration: InputDecoration(),
                    ),


                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * .022),
                    Text("Phone Number", style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.black45,
                        fontSize: 20),),
                    TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.lato(),
                      decoration: const InputDecoration(

                      ),


                    ),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * .022),

                  ],
                ),
              ),

            ]
        ),
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