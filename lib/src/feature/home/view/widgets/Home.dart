import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/alluser/view/allUser.dart';
import 'package:growlife/src/feature/chat/view/chat.dart';
import 'package:growlife/src/feature/home/view/widgets/videoList.dart';
import 'package:growlife/src/feature/notification/view/notification.dart';
import 'package:growlife/src/feature/profile/controller/userdetail_controller.dart';
import 'package:growlife/src/feature/profile/view/profile.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/utils/route.dart';

import '../../../shopping/view/widgets/product_detail.dart';
import 'videodetail.dart';
class Home extends ConsumerStatefulWidget {
  const Home({Key? key,}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late final PageController pagecontroller;
  String? name;
  String profile="https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg";
  Size get preferredSize => const Size.fromHeight(90);
  @override
  void initState(){
    pagecontroller=PageController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ref.watch(feedControllerProvider.notifier).fetchData();
    final userDetailsState = ref.watch(userControllerProvider);
    final feeds=ref.watch(feedControllerProvider);


    userDetailsState.when(
      data: (data) {
        name= data['username'] != null ? data['username'] as String : "";
        profile=data['profilePic']!= null ? data['profilePic'] as String : profile;
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
    );
    return SafeArea(child:
    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: preferredSize.height ,
        elevation: 0,
        title: Padding(
          padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.01 ,left:  MediaQuery.of(context).size.height*.01,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only( bottom: MediaQuery.of(context).size.height*.01
                ),
                child: InkWell(
                  onTap: (){
                    ref.refresh(videoControllerProvider);
                    ref.refresh(userControllerProvider);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Profile()));
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(profile),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding:  const EdgeInsets.all(2.0),
                              child: Container( height:MediaQuery.of(context).size.height*.013,
                                width: MediaQuery.of(context).size.width*.03,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF20C968),
                                    shape: BoxShape.circle
                                ),),
                            )
                        ),

                      ),
                    ],
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello,",style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                    Text(name!,style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black),),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            router.push(AllUser.routePath);
          }, icon: const Icon(EvaIcons.search,size: 25,color: Colors.black,)),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Notifications()));
              },
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Notifications()));
              },
                  icon: Stack(
                    children: [
                      const Icon(EvaIcons.bell,size: 25,color: Colors.black,),
                      Positioned(
                        right: 0,
                        top: 0,
                        child:
                        Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF20C968)
                          ),
                        ),
                      )
                    ],
                  ))),
          IconButton(onPressed: (){
            router.push(ChatView.routePath);
          },
              icon: Stack(
                children: [
                  const Icon(EvaIcons.messageCircle,size: 25,color: Colors.black,),
                  Positioned(
                    right: 0,
                    top: 0,
                    child:
                    Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF20C968)
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          ref.refresh(feedControllerProvider);
        },
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: AnimationConfiguration.synchronized(
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height:MediaQuery.of(context).size.height*.36,
                            child: PageView.builder(
                                controller: pagecontroller,
                                itemBuilder:(_,index){
                                  return AnimatedBuilder(animation: pagecontroller, builder:(context,child){
                                    return child!;
                                  },
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.015,vertical:  MediaQuery.of(context).size.height*.012 ),
                                      child: Column(
                                        children: [
                                          Image.asset(ImageAssets.homepage1,height:  MediaQuery.of(context).size.height*.15,width:  MediaQuery.of(context).size.width*1,),
                                          Container(
                                              alignment: AlignmentDirectional.topStart,

                                              child: Text("Green Thumb Gardening Workshop",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 17),)),
                                          SizedBox(height: MediaQuery.of(context).size.height*.005 ,),
                                          Row(
                                            children: [
                                              Text("Date: ",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 16),),
                                              Text("Saturday, August 14th, 2023",style: GoogleFonts.roboto(fontWeight: FontWeight.w400,fontSize: 16),)
                                            ],
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height*.0045 ,),
                                          Container(
                                              alignment:AlignmentDirectional.topStart,
                                              child: Text("Join us for a community-wide tree planting event! \nTogether, we aim to grow 500 new trees in City Park. ",style:GoogleFonts.roboto(fontWeight: FontWeight.w400,fontSize: 15),)),
                                          SizedBox(height: MediaQuery.of(context).size.height*.015 ,),
                                          Row(
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context).size.height*.045 ,
                                                width: MediaQuery.of(context).size.width*.28 ,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: const Color(0xFF1F588E),
                                                  ),
                                                ),
                                                child: Center(child: Text("View Event",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,color: const Color(0xFF1F588E),fontWeight: FontWeight.bold  ),)),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.height*.05 ,),
                                              Container(
                                                height: MediaQuery.of(context).size.height*.045 ,
                                                width: MediaQuery.of(context).size.width*.23 ,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: const Color(0xFF1F588E)
                                                    )
                                                ),
                                                child: Center(child: Text("Donate",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.02,color: const Color(0xFF1F588E),fontWeight: FontWeight.bold  ),)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.02),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                Text("Feed", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 20)),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                feeds.isEmpty
                                    ? const Center(child: CircularProgressIndicator())
                                    : AnimationLimiter(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: feeds.length, // Assuming 'videos' is a list of video data
                                    itemBuilder: (context, index) {
                                      var feed = feeds[index];
                                      if(index < feeds.length){
                                        return AnimationConfiguration.staggeredList(
                                          position: index,
                                          duration: const Duration(milliseconds: 500),
                                          child: SlideAnimation(
                                            verticalOffset: 50,
                                            child: FadeInAnimation(
                                              child: VideoList(
                                                ownerName: feed.uploaderDetails.username,
                                                ownerImg: feed.uploaderDetails.profilePic,
                                                views: feed.views.toString(),
                                                timeofUploading: feed.formattedTimeDifference,
                                                video: feed.videoUrl,
                                                videoTitle: feed.title,
                                                onTap: () {
                                                  router.push(VideoDetailScreen.routePath);
                                                },
                                                Id: feed.id, IsLiked: feed.isLikedByMe,
                                                commentCount: feed.commentsCount.toString(),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        if (ref.read(feedControllerProvider.notifier).hasMoreData) {
                                          ref.read(feedControllerProvider.notifier).fetchData();
                                          return CircularProgressIndicator();
                                        } else {
                                          return Text("Visit Again");
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    )
    );
  }

}