import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/home/controller/singleVideo_controller.dart';
import 'package:growlife/src/feature/home/view/widgets/videodetail.dart';
import 'package:video_player/video_player.dart';

class VideoList extends ConsumerStatefulWidget {
   final String ownerName;
   final String ownerImg;
   final String views;
   final String timeofUploading;
   final String video;
   final String videoTitle;
   final VoidCallback? onTap;
   final String Id;
   final bool IsLiked;
   final String commentCount;
  const VideoList( {Key? key, required this.ownerName, required this.ownerImg, required this.views, required this.timeofUploading, required this.video, required this.videoTitle, required this.onTap, required this.Id, required this.IsLiked,required this.commentCount,}) : super(key: key);

  @override
  ConsumerState<VideoList> createState() => _VideoListState();
}

class _VideoListState extends ConsumerState<VideoList> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.ownerImg),
          ),
          title: Text(widget.ownerName,style: GoogleFonts.plusJakartaSans(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
          subtitle: Row(
              children:[
                Text(widget.views.toString()+" Views",style: GoogleFonts.lato(),),
                const SizedBox(width: 15,),
                Text(widget.timeofUploading,style:  GoogleFonts.lato(),),
              ]

          ),
          trailing: const Icon(Icons.more_vert,size: 25,),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>VideoDetailScreen(video:widget.video,ownerName: widget.ownerName, ownerImg: widget.ownerImg,Id: widget.Id, commentCount:widget.commentCount ,)));
                ref.refresh(feedControllerProvider);
              },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 16 / 9,
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
            ),
          ),
        ),
      ],
    );

  }
}
