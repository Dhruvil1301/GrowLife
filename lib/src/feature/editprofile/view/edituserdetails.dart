import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/profile/view/profile.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
 class EditProfile extends StatefulWidget {

   const EditProfile({Key? key}) : super(key: key);
   static const routePath="/editprofile";
   @override
   State<EditProfile> createState() => _EditProfileState();
 }

 class _EditProfileState extends State<EditProfile> {
   final text=TextEditingController();
   final text2=TextEditingController();

   File? file;
   ImagePicker image = ImagePicker();
   String _typeValue = '';
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: CommonAppBar(title: 'Edit Profile',
         action: [
           Text("Update",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w500,fontSize: 18,color: AppColor.primary),),
         ],
       ),
       body: SingleChildScrollView(
         child: Column(
           children: [
                 Padding(
                   padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.03 ),
                   child: Column(
                     children: [
                       Container(
                         height: MediaQuery.of(context).size.height*.1,
                         width: MediaQuery.of(context).size.width*.24,
                         decoration: BoxDecoration(
                           color: Colors.black12,
                           borderRadius: BorderRadius.circular(40),
                         ),
                         child:ClipRRect(
                             borderRadius: BorderRadius.circular(40),
                             child: Provider.of<CustomImageProvider>(context).image==null
                                 ? Image.asset(ImageAssets.profile,height: MediaQuery.of(context).size.height*.08,width: MediaQuery.of(context).size.width*.07,)
                                 :  Image(image: FileImage(Provider.of<CustomImageProvider>(context).image!),fit: BoxFit.cover,)
                         ),
                       ),
                       SizedBox(height:  MediaQuery.of(context).size.height*.02,),
                       InkWell(
                         onTap: (){
                           _showImageSourceDialog(context);
                         },
                           child: Text("Edit Picture",style:  GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w500,fontSize: 18,color: AppColor.primary),))
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   Text("Name",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,color: Colors.black45,fontSize: 20),),
                   TextFormField(
                     controller: text,
                     style: GoogleFonts.lato(),
                     decoration: const InputDecoration(

                     ),



                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*.022),
                   Text("Username",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,color: Colors.black45,fontSize: 20),),
                   TextFormField(
                     style: GoogleFonts.lato(),
                     decoration: const InputDecoration(

                     ),



                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*.022),
                   Text("Bio",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,color: Colors.black45,fontSize: 20),),
                   TextFormField(
                     style: GoogleFonts.lato(),
                     decoration: const InputDecoration(

                     ),



                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*.022),
                   Text("Gender",style:GoogleFonts.poppins(fontWeight: FontWeight.w400,color: Colors.black45,fontSize: 20),),
                   SizedBox(height: MediaQuery.of(context).size.height*.022),
                   DropdownButtonFormField(items:   [
                     DropdownMenuItem(value:'1', child: Text("Male",style: GoogleFonts.poppins(),)),
                     DropdownMenuItem(value:'2', child: Text('Female',style: GoogleFonts.poppins(),)),

                   ],
                     style: GoogleFonts.lato(color: Colors.black,fontSize: 17),
                     validator: (value) {
                       if (_typeValue.isEmpty) {
                         return '';
                       }
                       return null;
                     },
                     onChanged:
                         (value) {
                       setState(() {
                         _typeValue= value as String;
                       });
                     },
                     decoration: const InputDecoration(



                     ),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*.022),
                   Text("Phone Number",style:GoogleFonts.poppins(fontWeight: FontWeight.w400,color: Colors.black45,fontSize: 20), ),
                   TextFormField(
                     keyboardType: TextInputType.number,
                     style: GoogleFonts.lato(),
                     decoration: const InputDecoration(

                     ),



                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*.022),
                   Text("Email",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,color: Colors.black45,fontSize: 20),),
                   TextFormField(
                     controller: text2,
                     style: GoogleFonts.lato(),
                     decoration: const InputDecoration(

                     ),



                   ),

               ],
             ),
                 ),

           ]
         ),
       ),
     );
   }


getcam() async {
  var img = await image.pickImage(source: ImageSource.camera);
  setState(() {
    Provider.of<CustomImageProvider>(context as BuildContext, listen: false).setImage(File(img!.path));
  });
}

getgall() async {
  var img = await image.pickImage(source: ImageSource.gallery);
  setState(() {
    Provider.of<CustomImageProvider>(context as BuildContext, listen: false).setImage(File(img!.path));
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
              leading: const Icon(Icons.folder),
              title: Text('Folder',style: GoogleFonts.lato(),),
              onTap: () {
                getgall(); // Call getgall() when Folder is chosen.
                Navigator.of(context).pop(); // Close the dialog.
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
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
