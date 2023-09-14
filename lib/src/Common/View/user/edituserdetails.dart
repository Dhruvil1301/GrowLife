import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/Common/View/user/profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
 class EditProfile extends StatefulWidget {
   const EditProfile({Key? key}) : super(key: key);

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
       appBar: AppBar(
         automaticallyImplyLeading: false,
         backgroundColor: Colors.white,
         elevation: 1,
         title: Row(
           children: [
             InkWell(
                 onTap:(){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                 },
                 child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
             SizedBox(width:  MediaQuery.of(context).size.height*.030,),
             Text("Edit Profile",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.025,),),


           ],
         ),
         actions: [
           Padding(
             padding:  EdgeInsets.only(right: 10),
             child: InkWell(
               onTap: (){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Profile()));
               },
                 child: Center(child: Text("Update",style: GoogleFonts.lato(color: Color(0xFF1F588E),fontSize:  MediaQuery.of(context).size.height*.022,)))),
           )
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
                                 ? Image.asset("assets/images/profile.png",height: MediaQuery.of(context).size.height*.08,width: MediaQuery.of(context).size.width*.07,)
                                 :  Image(image: FileImage(Provider.of<CustomImageProvider>(context).image!),fit: BoxFit.cover,)
                         ),
                       ),
                       SizedBox(height:  MediaQuery.of(context).size.height*.02,),
                       InkWell(
                         onTap: (){
                           _showImageSourceDialog(context);
                         },
                           child: Text("Edit Picture",style: GoogleFonts.lato(color: Color(0xFF1F588E),fontSize:  MediaQuery.of(context).size.height*.022,)))
                     ],
                   ),
                 ),
                 Column(
               children: [
                 Padding(
                   padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.34 ),
                   child: Text("Name",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black45,fontSize:  MediaQuery.of(context).size.height*.025),),
                 ),
                 Padding(
                     padding: EdgeInsets.symmetric(vertical: 0,horizontal: MediaQuery.of(context).size.width*.1),
                     child: TextFormField(
                       controller: text,
                       style: GoogleFonts.lato(),
                       decoration: InputDecoration(

                       ),



                     )),
                 SizedBox(height: MediaQuery.of(context).size.height*.022),
                 Padding(
                   padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.3),
                   child: Text("Username",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black45,fontSize:  MediaQuery.of(context).size.height*.025),),
                 ),
                 Padding(
                     padding: EdgeInsets.symmetric(vertical: 0,horizontal: MediaQuery.of(context).size.width*.1),
                     child: TextFormField(
                       style: GoogleFonts.lato(),
                       decoration: InputDecoration(

                       ),



                     )),
                 SizedBox(height: MediaQuery.of(context).size.height*.022),
                 Padding(
                   padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.37 ),
                   child: Text("Bio",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black45,fontSize:  MediaQuery.of(context).size.height*.025),),
                 ),
                 Padding(
                     padding: EdgeInsets.symmetric(vertical: 0,horizontal: MediaQuery.of(context).size.width*.1),
                     child: TextFormField(
                       style: GoogleFonts.lato(),
                       decoration: InputDecoration(

                       ),



                     )),
                 SizedBox(height: MediaQuery.of(context).size.height*.022),
                 Padding(
                   padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.325 ),
                   child: Text("Gender",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black45,fontSize:  MediaQuery.of(context).size.height*.025),),
                 ),
                 SizedBox(height: MediaQuery.of(context).size.height*.022),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.1 ),
                   child: DropdownButtonFormField(items:  [
                     DropdownMenuItem(child: Text("Male"),value:'1'),
                     DropdownMenuItem(child: Text('Female'),value:'2'),

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
                     decoration: InputDecoration(



                     ),
                   ),
                 ),
                 SizedBox(height: MediaQuery.of(context).size.height*.022),
                 Padding(
                   padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.25 ),
                   child: Text("Phone Number",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black45,fontSize:  MediaQuery.of(context).size.height*.025),),
                 ),
                 Padding(
                     padding: EdgeInsets.symmetric(vertical: 0,horizontal: MediaQuery.of(context).size.width*.1),
                     child: TextFormField(
                       keyboardType: TextInputType.number,
                       style: GoogleFonts.lato(),
                       decoration: InputDecoration(

                       ),



                     )),
                 SizedBox(height: MediaQuery.of(context).size.height*.022),
                 Padding(
                   padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height*.35 ),
                   child: Text("Email",style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.black45,fontSize:  MediaQuery.of(context).size.height*.025),),
                 ),
                 Padding(
                     padding: EdgeInsets.symmetric(vertical: 0,horizontal: MediaQuery.of(context).size.width*.1),
                     child: TextFormField(
                       controller: text2,
                       style: GoogleFonts.lato(),
                       decoration: InputDecoration(

                       ),



                     )),

               ],
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
