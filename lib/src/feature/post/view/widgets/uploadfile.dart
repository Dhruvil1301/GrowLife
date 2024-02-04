import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/post/view/widgets/addDetail.dart';

import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
class VideoGridView extends StatefulWidget {
  @override
  _VideoGridViewState createState() => _VideoGridViewState();
}

class _VideoGridViewState extends State<VideoGridView> {
  List<File>? videoFiles; // Use File instead of PlatformFile

  @override
  void initState() {
    super.initState();
    loadVideoFiles();
  }

  Future<void> loadVideoFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      final files = result.files.map((file) => File(file.path.toString())).toList();
      setState(() {
        videoFiles = files;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context,listen: false );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 1,
        title: Row(
          children: [
            InkWell(
                onTap: (){
                  Navigator.pop(context); // Use pop to go back
                },
                child: Icon(EvaIcons.arrowBack,color: Colors.black,size:MediaQuery.of(context).size.height*.04 ,)),
            SizedBox(width:MediaQuery.of(context).size.width*.63 ,),
            Builder(
              builder: (context) => InkWell(
                onTap: () {
                  if (videoFiles != null && videoFiles!.isNotEmpty) {
                    final selectedVideo = videoFiles![0];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen(
                          videoFile: selectedVideo,
                        ),
                      ),
                    );
                  } else {

                    return null;
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0xFF1F588E),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        color: Color(0xFF1F588E),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
      body: videoFiles == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: videoFiles!.length,
        itemBuilder: (context, index) {
          final videoFile = videoFiles![index];
          final videoController = VideoPlayerController.file(videoFile);
          return GestureDetector(
            onTap: () {
              videoProvider.setSelectedVideo(videoFile);
            },
            child: VideoThumbnail(videoController: videoController),
          );
        },
      ),
    );
  }
}
class VideoThumbnail extends StatefulWidget {
  final VideoPlayerController videoController;

  VideoThumbnail({required this.videoController});

  @override
  _VideoThumbnailState createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<VideoThumbnail> {
  @override
  void initState() {
    super.initState();
    initializeVideoController();
  }

  Future<void> initializeVideoController() async {
    await widget.videoController.initialize();
    if (mounted) {
      setState(() {}); // Ensure that the widget is still mounted before updating
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Play the video when tapped
        // No need to navigate here, just select the video in the GridView

      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.03,horizontal: MediaQuery.of(context).size.height*.02 ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*.7, // Expand the container to full width
                    height: MediaQuery.of(context).size.height*.7,
                    child: widget.videoController.value.isInitialized
                        ? VideoPlayer(widget.videoController)
                        : Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.28,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: Text("Edit Video",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.023,color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.28,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: Text("Add Clips",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.023,color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.videoController.dispose();
    super.dispose();
  }
}

