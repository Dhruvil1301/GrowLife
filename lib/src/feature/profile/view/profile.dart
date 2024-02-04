import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:growlife/src/Common/Providers/providerall.dart";
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/editprofile/view/edituserdetails.dart';
import 'package:growlife/src/feature/account/view/follwers_following.dart';
import 'package:growlife/src/feature/setting/view/Setting.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';
import "package:provider/provider.dart";
class Profile extends StatefulWidget {


  const Profile({Key? key}) : super(key: key);
  static const routePath="/profile";

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {

  late final PageController pagecontroller;

  late TabController _tabController;

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
    return Scaffold(
      backgroundColor: Color(0xFFDCE9F8),
      appBar: CommonAppBar(title: "Profile",action: [
        IconButton(onPressed: (){
          router.push(Setting.routePath);
        }, icon: Icon(Icons.settings,size: 25,))
      ],),
      body: SingleChildScrollView(
        child: Stack(
          children: [

            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.16 ,),


                    Container(
                      height:  MediaQuery.of(context).size.height*1.7,
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
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                                             },
                                          child: Row(
                                            children: [

                                              Text("Edit",style:  GoogleFonts.plusJakartaSans(fontSize:14 ,color: AppColor.primary),),
                                              SizedBox(width:MediaQuery.of(context).size.width*.02 ,),
                                              Icon(Icons.edit,color: Color(0xFF1F588E) ,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height:MediaQuery.of(context).size.height*.03 ,),
                                  Text("Tara Choudhary",style: GoogleFonts.plusJakartaSans(fontSize:16 ,fontWeight: FontWeight.w600),),
                                  Text("@tara_choudhary",style: GoogleFonts.plusJakartaSans(fontSize:12 ,fontWeight: FontWeight.w500), ),
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
                                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Follower_Following())) ;
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
                                        tabs: [
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
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: TabBarView(
                                        controller: _tabController,
                                        children: [
                                          // Widgets for Tab 1 content
                                         Column(
                                           children: [
                                             for(int i=0;i<4;i++)
                                             Padding(
                                               padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.01,vertical: MediaQuery.of(context).size.height*.01 ),
                                               child: i==0||i==3?Image.asset("assets/images/tbvideo.png"):i==1||i==4?Image.asset("assets/images/tbvideo2.png"):Image.asset("assets/images/tbvideo3.png")
                                             ),
                                           ],
                                         ),

                                          // Widgets for Tab 2 content
                                          Center(child: Text('Tab 2 Content')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),



                    ),

              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*.12,
              left: MediaQuery.of(context).size.height*.182,
              child: Container(
                width: MediaQuery.of(context).size.width*.25,
                height: MediaQuery.of(context).size.height*.11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.034),
                  image: Provider.of<CustomImageProvider>(context).image != null
                      ? DecorationImage(
                    image: FileImage(Provider.of<CustomImageProvider>(context).image!),
                    fit: BoxFit.cover,
                  )
                      :null ,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

