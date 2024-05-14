import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/home/controller/like_controller.dart';
import 'package:growlife/src/feature/home/controller/singleVideo_controller.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/feature/home/view/widgets/commentbox.dart';
import 'package:growlife/src/feature/home/view/widgets/videoList.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:video_player/video_player.dart';
class VideoDetailScreen extends ConsumerStatefulWidget {
  final String ownerName;
  final String ownerImg;
  final String video;
  final String Id;
  const VideoDetailScreen({Key? key, required this.ownerName, required this.ownerImg,  required this.video,  required this.Id,}) : super(key: key);
  static const routePath="/videodetail";
  @override
  ConsumerState<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends ConsumerState<VideoDetailScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late Timer _timer;
  late Duration _currentPosition;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });
    _currentPosition = Duration.zero;
    _timer = Timer.periodic(Duration(seconds: 1), _updatePosition);
  }

  void _updatePosition(Timer timer) {
    if (_controller.value.isPlaying) {
      setState(() {
        _currentPosition = _controller.value.position;
      });
    }
  }
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String twoDigitHours = twoDigits(duration.inHours);
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  String _getDurationString() {
    if (_controller.value.duration == null) return "0:00 / 0:00";
    String currentDuration = _formatDuration(_currentPosition);
    String totalDuration = _formatDuration(_controller.value.duration!);
    return "$currentDuration / $totalDuration";
  }
  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  String selectedQuality = 'Auto';
  String selectedSpeed ="Normal";
  int _selectedDownloadQuality = 0;
  bool isFeatureEnabled = false;
  bool isWatchlater=true;
  bool isAddtoPlaylist=false;
  void _updateFeature(bool newValue) {
    setState(() {
      isFeatureEnabled = newValue;
    });
  }
  void _toggleFeature() {
    setState(() {
      isFeatureEnabled = !isFeatureEnabled;
    });

    // Show a Snackbar when the feature is turned on/off
    final snackBarCaption = SnackBar(
      content:
         Text(
          isFeatureEnabled ? 'Captions turned ON' : 'Captions turned OFF',
        style: GoogleFonts.lato(),),

      duration: const Duration(seconds: 3), // Adjust the duration as needed
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBarCaption);
  }


  @override
  Widget build(BuildContext context) {
    final likeController = ref.read(likeControllerProvider);
    final singleVideoState = ref.watch(singleVideoProvider(widget.Id));
    return  singleVideoState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
        data: (response) => SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio:16/9,
                        child: FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return VideoPlayer(_controller);
                            } else {
                              return const Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                      Positioned(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () {
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  _controller.play();
                                }
                                setState(() {

                                });
                              },
                              icon: Icon(
                                _controller.value.isPlaying? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top:  2,
                        left:3 ,
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                            },
                            child: Icon(Icons.arrow_back,color: Colors.white,size: MediaQuery.of(context).size.height*.035,)),
                      ),
                      const Positioned(
                        top:  2,
                        right: 40 ,
                        child: Icon(Icons.closed_caption_off,color: Colors.white,size: 25,),
                      ),
                      Positioned(
                        top:  2,
                        right: 5,
                        child: InkWell(
                            onTap: (){

                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                                builder: (BuildContext context) {
                                  return Container(
                                    constraints: BoxConstraints(
                                      minHeight: MediaQuery.of(context).size.height*.2, // Minimum height of the bottom sheet
                                      maxHeight: MediaQuery.of(context).size.height*.35, // Maximum height of the bottom sheet
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*.01),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*.007,
                                            width: MediaQuery.of(context).size.width*.2,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.13,),
                                              color: Colors.grey.withOpacity(.5),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.02 ),
                                          child: Column(

                                            children: [
                                              ListTile(
                                                leading: const Icon(Icons.settings,size: 25,),
                                                title: Row(
                                                  children: [
                                                    Text('Quality:',style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04 ),),
                                                    SizedBox(width:MediaQuery.of(context).size.width*.06 ), // Add spacing
                                                    DropdownButton<String>(
                                                      value: selectedQuality,
                                                      items: ['Auto', '240p', '720p', '1080p'].map((String quality) {
                                                        return DropdownMenuItem<String>(
                                                          value: quality,
                                                          child: Text(quality,style: GoogleFonts.lato(),),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String ?newValue) {
                                                        setState(() {
                                                          selectedQuality = newValue!;
                                                        });
// You can add logic here to update the video quality based on the selected option.
// Example: _setVideoQuality(newValue);
                                                        Navigator.pop(context);
                                                      },
                                                      underline: Container(),
                                                    ),
                                                  ],
                                                ),
                                                onTap: () {
// Remove this onTap handler if you want to use the dropdown only
                                                },
                                              ),
                                              ListTile(
                                                leading: const Icon(Icons.closed_caption),
                                                title: Row(
                                                  children: [
                                                    Text('Captions',style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04)),
                                                    SizedBox(width:MediaQuery.of(context).size.width*.01 ),
                                                    Switch(
                                                      value: isFeatureEnabled,
                                                      onChanged: (bool newValue) {
                                                        _toggleFeature();
                                                        Navigator.pop(context);
                                                      },
                                                      activeTrackColor: Colors.lightBlueAccent.withOpacity(.5),
                                                      activeColor: Colors.blue,
                                                    ),
                                                  ],
                                                ),
                                                onTap: () {
                                                  _toggleFeature();
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                leading: const Icon(Icons.speed),
                                                title: Row(
                                                  children: [
                                                    Text('Speed',style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width*.04 ),),
                                                    SizedBox(width:MediaQuery.of(context).size.width*.09 ),
                                                    DropdownButton<String>(
                                                      value: selectedSpeed,
                                                      items: ['0.25x', '0.5x', '0.75x', 'Normal',"1.25x","1.5x","1.75","2x"].map((String quality) {
                                                        return DropdownMenuItem<String>(
                                                          value: quality,
                                                          child: Text(quality,style: GoogleFonts.lato(),),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String ?newValue) {
                                                        setState(() {
                                                          selectedSpeed = newValue!;
                                                        });
                                                        double speedValue = 1.0;
                                                        switch (selectedSpeed) {
                                                          case '0.25x':
                                                            speedValue = 0.25;
                                                            break;
                                                          case '0.5x':
                                                            speedValue = 0.5;
                                                            break;
                                                          case '0.75x':
                                                            speedValue = 0.75;
                                                            break;
                                                          case 'Normal':
                                                            speedValue = 1.0;
                                                            break;
                                                          case '1.25x':
                                                            speedValue = 1.25;
                                                            break;
                                                          case '1.5x':
                                                            speedValue = 1.5;
                                                            break;
                                                          case '1.75x':
                                                            speedValue = 1.75;
                                                            break;
                                                          case '2x':
                                                            speedValue = 2.0;
                                                            break;
                                                        }
                                                        _controller.setPlaybackSpeed(speedValue);
// You can add logic here to update the video speed based on the selected option.
                                                        Navigator.pop(context);
                                                      },
                                                      underline: Container(),
                                                    ),
                                                  ],
                                                ),
                                                onTap: () {

                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Icon(Icons.settings,color: Colors.white,size: 25,)),
                      ),
                      Positioned(
                          bottom:  2,
                          left:3 ,
                          child: Text(_getDurationString(),style: GoogleFonts.montserrat(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
                      ),
                      const Positioned(
                          bottom:  2,
                          right:3 ,
                          child: Icon(Icons.fullscreen,color: Colors.white,size:25 ,)
                      ),
                    ],

                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height*.013,),
                  Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width*.04 ),
                        child: Text(response.video.title,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize:  16),),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
                    child: Row(
                      children: [
                        Padding(
                            padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.02 ),
                            child:CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(widget.ownerImg),
                            )
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height*.01),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.ownerName,style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600,fontSize: 16),),
                              Row(
                                children: [
                                  Text(response.video.views.toString()+" Views",style: GoogleFonts.poppins(fontSize:  14,fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width:  MediaQuery.of(context).size.height*.012,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("FOLLOW",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: AppColor.primary,fontSize:  13),),

                            Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.height*.022),
                                  child: Text(response.formattedTimeDifference,style: GoogleFonts.poppins(fontSize:  14,fontWeight: FontWeight.w400),),
                                ),
                              ],
                            ),
                          ],
                        )



                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              IconButton(onPressed: () async {
                                try {
                                  if (response.isLikedByMe) {
                                    await likeController.likeUser(widget.Id);
                                  } else {
                                    await likeController.likeUser(widget.Id);
                                  }
// Refresh the user data after follow/unfollow action
                                  ref.refresh(feedControllerProvider);
                                } catch (error) {
                                  print('Error: $error');
                                }
                              }, icon: response.isLikedByMe?const Icon(Icons.favorite,color: Colors.red,size: 25,):const Icon(Icons.favorite_border,size: 25,color: Colors.black38,)),
                              Text(response.video.likes.length.toString(),style: GoogleFonts.roboto(fontSize: 12),),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20 ),
                            child: Column(
                              children: [
                                InkWell(
                                    onTap: (){
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),// Enable scrolling in the bottom sheet
                                        builder: (BuildContext context) {
                                          return Commentbox();
                                        },
                                      );
                                    },
                                    child: const Icon(Icons.comment_outlined,color: Colors.black,size: 25)),
                                Text(response.video.comments.length.toString(),style: GoogleFonts.roboto(fontSize: 12),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20 ),
                            child: InkWell(
                                onTap: (){
                                  showModalBottomSheet<void>(
                                    context: context,
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                                    builder: (BuildContext context) {
                                      return Container(
                                        constraints: BoxConstraints(
                                          minHeight: MediaQuery.of(context).size.height*.2, // Minimum height of the bottom sheet
                                          maxHeight: MediaQuery.of(context).size.height*.35, // Maximum height of the bottom sheet
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*.01),
                                              child: Container(
                                                height: MediaQuery.of(context).size.height*.01,
                                                width: MediaQuery.of(context).size.width*.2,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.13,),
                                                    color: Colors.grey
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.03, ),
                                              child: Container(
                                                  alignment: AlignmentDirectional.topStart,
                                                  child: Image.asset(ShareAssets.copylink,height: MediaQuery.of(context).size.height*.1,width: MediaQuery.of(context).size.height*.18,)),

                                            ),
                                            Container(
                                              height:MediaQuery.of(context).size.height*.0005 ,
                                              width: MediaQuery.of(context).size.width*1,
                                              color: Colors.black,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.03,horizontal:  MediaQuery.of(context).size.height*.04 ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Image.asset(ShareAssets.whatsapp,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                                  Image.asset(ShareAssets.tiwtter,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                                  Image.asset(ShareAssets.instagram,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                                  Image.asset(ShareAssets.facebook,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01,horizontal:  MediaQuery.of(context).size.height*.04 ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Image.asset(ShareAssets.drive,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                                  Image.asset(ShareAssets.mail,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                                  Image.asset(ShareAssets.bluetooth,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                                  Image.asset(ShareAssets.more,height: MediaQuery.of(context).size.height*.06,width: MediaQuery.of(context).size.height*.06,),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );

                                },
                                child: Column(
                                  children: [
                                    const Icon(Icons.share_rounded,color: Colors.black,size: 25),
                                    Text("Share",style: GoogleFonts.roboto(fontSize: 12),)
                                  ],
                                )),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 20 ),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context, StateSetter setState) {
                                        return Container(
                                          constraints: BoxConstraints(
                                            minHeight: MediaQuery.of(context).size.height * .2,
                                            maxHeight: MediaQuery.of(context).size.height * .4,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
                                                child: Container(
                                                  height: 5,
                                                  width: MediaQuery.of(context).size.width * .2,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    color: Colors.black26,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(12.0),
                                                      child: Text("Download Quality", style: GoogleFonts.poppins(fontSize: 16)),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Radio<int>(
                                                          activeColor: AppColor.greenColor,
                                                          value: 0,
                                                          groupValue: _selectedDownloadQuality,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _selectedDownloadQuality = value!;
                                                            });
                                                          },
                                                        ),
                                                        Text(
                                                          'Low (144p)',
                                                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Radio<int>(
                                                          activeColor: AppColor.greenColor,
                                                          value: 1,
                                                          groupValue: _selectedDownloadQuality,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _selectedDownloadQuality = value!;
                                                            });
                                                          },
                                                        ),
                                                        Text(
                                                          'Medium (360p)',
                                                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Radio<int>(
                                                          activeColor: AppColor.greenColor,
                                                          value: 2,
                                                          groupValue: _selectedDownloadQuality,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _selectedDownloadQuality = value!;
                                                            });
                                                          },
                                                        ),
                                                        Text(
                                                          'High (720p)',
                                                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Radio<int>(
                                                          activeColor: AppColor.greenColor,
                                                          value: 3,
                                                          groupValue: _selectedDownloadQuality,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _selectedDownloadQuality = value!;
                                                            });
                                                          },
                                                        ),
                                                        Text(
                                                          'Full HD (1080p)',
                                                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(5),
                                                        border: Border.all(
                                                            color: AppColor.lightGreenColor,
                                                            width: 2
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                                                        child: Center(
                                                          child: Text("Cancel", style: GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500, color: AppColor.lightGreenColor)),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColor.lightGreenColor,
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                                                        child: Center(
                                                          child: Text("Download", style: GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white)),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  const Icon(Icons.download_outlined, color: Colors.black, size: 25),
                                  Text("Download", style: GoogleFonts.roboto(fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20 ),
                            child: InkWell(
                                onTap: (){
                                  setState(() {
                                    isWatchlater=!isWatchlater;
                                  });
                                  final snackBarWatchLater = SnackBar(
                                    content: Text(
                                      isWatchlater ?'Removed from Watch Later': 'Added to Watch Later' ,
                                      style: GoogleFonts.lato(),
                                    ),
                                    duration: const Duration(seconds: 3),
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(snackBarWatchLater);

                                },
                                child: Column(
                                  children: [
                                    const Icon(Icons.access_time_sharp,color: Colors.black,size: 25),
                                    isWatchlater?Text("Watch Later",style: GoogleFonts.roboto(fontSize: 12),):Text("Remove",style: GoogleFonts.roboto(fontSize: 12),)
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20 ),
                            child: InkWell(
                                onTap: (){
                                  setState(() {
                                    isAddtoPlaylist=true;
                                  });
                                  final snackBarWatchLater = SnackBar(
                                    content: Text(
                                      isAddtoPlaylist ?'Video Added In Playlist': 'Already Your Video is Added' ,
                                      style: GoogleFonts.lato(),
                                    ),
                                    duration: const Duration(seconds: 3),
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(snackBarWatchLater);
                                },
                                child: Column(
                                  children: [
                                    isAddtoPlaylist? const Icon(Icons.check,color: AppColor.greenColor,size: 25):const Icon(Icons.add,color: Colors.black,size: 25),
                                    Text("Add to Playlist",style: GoogleFonts.roboto(fontSize: 12),)
                                  ],
                                )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    height:MediaQuery.of(context).size.height*.007 ,
                    width: MediaQuery.of(context).size.height*.5 ,
                    color: Colors.grey.withOpacity(.5),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                        alignment: AlignmentDirectional.topStart,
                        child: Text("Recommended videos",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w500,fontSize: 20),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01 ,),

                ],
              ),
            ),
          ),

        )

    );
  }
}
