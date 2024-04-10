import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Controller/shared_prefrenced.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/feature/home/view/widgets/Home.dart';
import 'package:growlife/src/feature/post/controller/uploadvideo_controller.dart';
import 'package:growlife/src/feature/post/view/widgets/location.dart';
import 'package:growlife/src/feature/post/view/widgets/uploadfile.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';
import 'package:video_player/video_player.dart';
class VideoPlayerScreen extends ConsumerStatefulWidget {
  final File videoFile;

  const VideoPlayerScreen({Key? key, required this.videoFile}) : super(key: key);

  @override
  ConsumerState<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends ConsumerState<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController addDiscriptionController = TextEditingController();
  int maxLength = 100;
  int addDisLength=5000;
  bool isLoading=false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(false)
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    final videoUpload=ref.read(uploadVideoFileRepositoryProvider);

    return Scaffold(
      appBar: CommonAppBar(title: 'Add Details',),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.02,
                      top: MediaQuery.of(context).size.height * 0.04),
                  child: Container(
                    alignment: AlignmentDirectional.topStart,
                    height: MediaQuery.of(context).size.height * 0.21,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: _controller.value.isInitialized
                        ? Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AspectRatio(
                            aspectRatio: 6 / 9,
                            child: VideoPlayer(_controller),
                          ),
                        ),
                      ],
                    )
                        : const CircularProgressIndicator(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(right:MediaQuery.of(context).size.height * 0.02,top: MediaQuery.of(context).size.height * 0.02,left:MediaQuery.of(context).size.height * 0.02  ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          TextFormField(
                            controller: titleController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Write a Caption",
                                hintStyle:GoogleFonts.plusJakartaSans(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
                                counterText:
                                '${titleController.text.length}/$maxLength',
                                counterStyle: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height * 0.018)
                            ),
                            style: GoogleFonts.lato(),
                            maxLines: 7,
                            maxLength: maxLength,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a caption.';
                              }
                              if (value.length > maxLength) {
                                return 'Caption is too long.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height * 0.01),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.001,
                width: double.infinity,
                color: Colors.black54,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.height*.03,vertical:  MediaQuery.of(context).size.height*.015),
                  child: Text("Add Description",style: GoogleFonts.poppins(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400 ),),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.height*.03,),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black12,
                            width: 2
                        )
                    ),
                    child: TextFormField(
                      controller: addDiscriptionController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: InputBorder.none,
                          counterText:
                          '${addDiscriptionController.text.length}/$addDisLength',
                          counterStyle: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height * 0.018)
                      ),
                      maxLines: 7,
                      style: GoogleFonts.lato(),


                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025,vertical:MediaQuery.of(context).size.height*.02 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.045),
                    child: Text("Visibility",style: GoogleFonts.plusJakartaSans(fontSize: 12,color: Colors.black38),),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.remove_red_eye_outlined,color: Colors.black,size: 25,),
                      Padding(
                        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.015,right: MediaQuery.of(context).size.width*.6 ),
                        child: Text("Public",style: GoogleFonts.plusJakartaSans(fontSize:16,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),

                      const Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  InkWell(
                    onTap: (){
                      router.push(PostLocation.routePath);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined,color: Colors.black,size:25,),
                        Padding(
                          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.015,right: MediaQuery.of(context).size.width*.55 ),
                          child: Text("Location",style: GoogleFonts.plusJakartaSans(fontSize:16,color: Colors.black,fontWeight: FontWeight.w500),),
                        ),

                        const Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Row(
                    children: [
                      const Icon(Icons.people,color: Colors.black,size: 25,),
                      Padding(
                        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.015,right: MediaQuery.of(context).size.width*.5),
                        child: Text("Tag People",style: GoogleFonts.plusJakartaSans(fontSize:16,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),

                      Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015,vertical: MediaQuery.of(context).size.height*.045 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*.06,
                          width: MediaQuery.of(context).size.width*.3,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(child: Text("Save Draft",style: GoogleFonts.plusJakartaSans(fontSize:18,color: Colors.white,fontWeight: FontWeight.w600),)),
                        ),

                        InkWell(
                          onTap: ()async {
                            setState(() {
                              isLoading=true;
                            });
                            Future.delayed(const Duration(seconds: 3), () {
                              setState(() {
                                isLoading = false;
                              });
                            });
                            final authController = ref.read(signInControllerProvider);
                            final userId = await SharedPreferencesServiceUser.getUser();
                                 if (!videoUpload.isUploading) {
                                       final uploaded =
                                     await videoUpload.uploadVideo(widget.videoFile,titleController.text,addDiscriptionController.text,userId.toString(),);
                                             if (uploaded) {
                                                  router.push(HomeScreen.routePath);
                                                   } else {
                                                    // Handle failed image upload.
                                                            }
                                                       } else {
                                                       // Show a message indicating that an upload is already in progress.
                                                            }
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*.06,
                            width: MediaQuery.of(context).size.width*.28,
                            decoration: BoxDecoration(
                              color:AppColor.primary,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: isLoading?const CircularProgressIndicator(color: Colors.white,):Text("Post",style:  GoogleFonts.plusJakartaSans(fontSize:18,color: Colors.white,fontWeight: FontWeight.w600),)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
