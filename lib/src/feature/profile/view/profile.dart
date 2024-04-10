import 'dart:io';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/editprofile/view/edituserdetails.dart';
import 'package:growlife/src/feature/account/view/follwers_following.dart';
import 'package:growlife/src/feature/profile/controller/getallvideo_controller.dart';
import 'package:growlife/src/feature/profile/view/widgets/myvideo.dart';
import 'package:growlife/src/feature/setting/view/Setting.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';
import 'package:video_player/video_player.dart';

import '../../../Common/Providers/providerall.dart';
class Profile extends ConsumerStatefulWidget {

  const Profile({Key? key}) : super(key: key);
  static const routePath="/profile";

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> with SingleTickerProviderStateMixin {

  late final PageController pagecontroller;

  late TabController _tabController;
  String? name;
  String? email;
  String profile="https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg";

  @override
  void initState() {
    super.initState();
    pagecontroller=PageController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final userDetailsState = ref.watch(userControllerProvider);

    userDetailsState.when(
      data: (data) {
        name= data['username'] != null ? data['username'] as String : "";
        profile=data['profilePic']!= null ? data['profilePic'] as String : profile;
        email=data['email']!=null?data['email'] as String:"";
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
    );
    return Scaffold(
      backgroundColor: const Color(0xFFDCE9F8),
      appBar: CommonAppBar(title: "Profile",action: [
        IconButton(onPressed: (){
          router.push(Setting.routePath);
        }, icon: const Icon(Icons.settings,size: 25,))
      ],),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [

            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.16 ,),


                    Container(
                      height:  MediaQuery.of(context).size.height*.8,
                      width:MediaQuery.of(context).size.width*1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight:Radius.circular(MediaQuery.of(context).size.height*.08),topLeft: Radius.circular(MediaQuery.of(context).size.height*.08))
                      ),
                        child:  Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.06,top: MediaQuery.of(context).size.height*.03 ),
                                        child: Container(
                                          alignment: AlignmentDirectional.topStart,
                                          child: Container(
                                            height:MediaQuery.of(context).size.height*.03,
                                            width: MediaQuery.of(context).size.width*.18,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:AppColor.primary,
                                              ),
                                            ),
                                            child: Center(child: Text("Follow",style: GoogleFonts.plusJakartaSans(fontSize:14 ,color: AppColor.primary),)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right:MediaQuery.of(context).size.height*.06,top: MediaQuery.of(context).size.height*.03),
                                        child: InkWell(
                                           onTap:(){
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfile()));
                                             },
                                          child: Row(
                                            children: [

                                              Text("Edit",style:  GoogleFonts.plusJakartaSans(fontSize:14 ,color: AppColor.primary),),
                                              SizedBox(width:MediaQuery.of(context).size.width*.02 ,),
                                              const Icon(Icons.edit,color: Color(0xFF1F588E) ,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height:MediaQuery.of(context).size.height*.02 ,),
                                  Text(name!,style: GoogleFonts.plusJakartaSans(fontSize:16 ,fontWeight: FontWeight.w600),),
                                  Text(email!,style: GoogleFonts.plusJakartaSans(fontSize:12 ,fontWeight: FontWeight.w500), ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.03,vertical: MediaQuery.of(context).size.height*.03),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text("Posts",style: GoogleFonts.plusJakartaSans(fontSize:14 ,fontWeight: FontWeight.w500),),
                                            Text("5",style: GoogleFonts.plusJakartaSans(fontSize:14 ,fontWeight: FontWeight.w400),),

                                          ],
                                        ),
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap:(){
                                               Navigator.push(context, MaterialPageRoute(builder: (context)=>const Follower_Following())) ;
                                              },
                                                child: Text("Followers",style:  GoogleFonts.plusJakartaSans(fontSize:14 ,fontWeight: FontWeight.w500),)),
                                            Text("100",style: GoogleFonts.plusJakartaSans(fontSize:14 ,fontWeight: FontWeight.w400),),

                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("Following",style:  GoogleFonts.plusJakartaSans(fontSize:14 ,fontWeight: FontWeight.w500),),
                                            Text("80",style:   GoogleFonts.plusJakartaSans(fontSize:14 ,fontWeight: FontWeight.w400),),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.03),
                                      child: TabBar(
                                        controller: _tabController,
                                        indicatorWeight: 2,
                                        indicatorColor: Colors.black,
                                        indicatorSize: TabBarIndicatorSize.label,
                                        labelColor: Colors.black,
                                        isScrollable: true,
                                        labelStyle: GoogleFonts.poppins(fontSize:14 ,fontWeight: FontWeight.w500),
                                        tabs: const[
                                          Tab(text: 'Videos'),
                                           Tab(text: 'Events'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height:MediaQuery.of(context).size.height*.0005,
                                    width: MediaQuery.of(context).size.width*1,
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child:  TabBarView(
                                        controller: _tabController,
                                        children: [
                                          // Widgets for Tab 1 content
                                           VideoListWidget(),

                                          // Widgets for Tab 2 content
                                          const Center(child: Text('Tab 2 Content')),
                                        ],
                                      ),
                                    ),
                                ],
                              ),



                    ),

              ],
            ),
            Positioned(
             top: 110,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(profile),
              )
            ),
          ],
        ),
      ),
    );
  }
}

