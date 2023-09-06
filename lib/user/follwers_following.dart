import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/user/profile.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
            Text("@tara_choudhary",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.025,),),
            SizedBox(width:  MediaQuery.of(context).size.height*.11,),
            Icon(Icons.settings,size: MediaQuery.of(context).size.height*.035 ,color: Colors.black,)


          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          labelStyle: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022,fontWeight: FontWeight.bold ),
          tabs: [
            Tab(text: 'Followers'),
            Tab(text: 'Following'),
          ],
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
                        borderRadius: BorderRadius.circular(15)
                    ),

                  ),
                ),
                for(int i=0;i<9;i++)
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.023),
                    child: Row(
                        children:[
                          Image.asset("assets/images/circularimg2.png",height:MediaQuery.of(context).size.height*.06),
                          SizedBox(width: MediaQuery.of(context).size.height*.02,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ROY",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022,fontWeight: FontWeight.bold ),),
                              Text("+919645348799",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.018),
                              ),
                            ],
                          ),
                          SizedBox(width: MediaQuery.of(context).size.height*.07,),
                          Container(
                            height:MediaQuery.of(context).size.height*.05 ,
                            width: MediaQuery.of(context).size.width*.25,
                            decoration: BoxDecoration(
                                color: Color(0xFF515151).withOpacity(.8),
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.01)
                            ),
                            child: Center(child: Text("Remove",style: GoogleFonts.lato(color: Colors.black,fontSize:MediaQuery.of(context).size.height*.02 ),)),
                          )

                        ]
                    ),
                  ),
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

                      ),
                    ),
                     for(int i=0;i<9;i++)
                     Padding(
                       padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.023),
                       child: Row(
                       children:[
                         Image.asset("assets/images/circularimg2.png",height:MediaQuery.of(context).size.height*.06),
                         SizedBox(width: MediaQuery.of(context).size.height*.02,),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("ROY",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022,fontWeight: FontWeight.bold ),),
                             Text("+919645348799",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.018),
                             ),
                           ],
                         ),
                         SizedBox(width: MediaQuery.of(context).size.height*.07,),
                         Container(
                           height:MediaQuery.of(context).size.height*.04 ,
                           width: MediaQuery.of(context).size.width*.25,
                           decoration: BoxDecoration(
                             color: Color(0xFF24BADB),
                             borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.01)
                           ),
                           child: Center(child: Text("Following",style: GoogleFonts.lato(color: Colors.white,fontSize:MediaQuery.of(context).size.height*.02 ),)),
                         )

      ]
           ),
                     ),
                  ],
                ),
              ),
            ),


      ]
    ),



    );
  }
}
