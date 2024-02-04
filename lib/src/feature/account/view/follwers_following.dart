import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/account/view/widgets/followerlist.dart';
import 'package:growlife/src/feature/account/view/widgets/followinglist.dart';
import 'package:growlife/src/feature/profile/view/profile.dart';
import 'package:growlife/src/feature/setting/view/Setting.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/utils/route.dart';
class Follower_Following extends StatefulWidget {
  const Follower_Following({Key? key}) : super(key: key);

  @override
  State<Follower_Following> createState() => _Follower_FollowingState();
}

class _Follower_FollowingState extends State<Follower_Following> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 50), // Adjust the height accordingly
        child: CommonAppBar(
          title: "@tara_choudhary",
          action: [
            IconButton(
              onPressed: () {
               router.push(Setting.routePath);
              },
              icon: Icon(Icons.settings, size: 25),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorWeight: 2,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            isScrollable: true,
            labelStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            tabs: [
              Tab(text: 'Followers'),
              Tab(text: 'Following'),
            ],
          ),
        ),
      ),
        body: TabBarView(
      controller: _tabController,
      children: [
           Padding(
          padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.023,vertical: MediaQuery.of(context).size.height*.02 ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search ",
                    hintStyle: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023 ),
                    prefixIcon: Icon(Icons.search,size:MediaQuery.of(context).size.height*.035 ,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.symmetric(),
                  ),
                ),
                for(int i=0;i<9;i++)
                 FollowerList(image: ImageAssets.circularimg2, name: "Roy", phoneNum: "+919645348799")
              ],
            ),
          ),
        ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.023,vertical: MediaQuery.of(context).size.height*.02 ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search ",
                        hintStyle: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023 ),
                        prefixIcon: Icon(Icons.search,size:MediaQuery.of(context).size.height*.035 ,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        contentPadding: const EdgeInsets.symmetric(),

                      ),
                    ),
                     for(int i=0;i<9;i++)
                       FollowingList(image: ImageAssets.circularimg2, name: "Roy", phoneNum: "+919645348799")
                  ],
                ),
              ),
            ),
      ]
    ),
    );
  }
}
