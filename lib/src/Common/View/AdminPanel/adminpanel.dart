import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/View/AdminPanel/dashboard.dart';
import 'package:growlife/src/Common/View/AdminPanel/users.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/images/Growlife.png",height: 130.h,),
            SizedBox(width: 20.w ,),
            Text("GROWLIFE",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:30.sp,color: Colors.black ),),
            SizedBox(width: 40.w ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 850.w,
                  height: 120.h ,
                  child: TextFormField(
                    decoration: InputDecoration(

                        hintText: "Search",
                        hintStyle: GoogleFonts.lato(),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        contentPadding:EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.02 )
                    ),
                  ),
                ),
                SizedBox(width: 200.w,),
                Image.asset("assets/dashboard/notificationgrey.png",width:50.w ,),
                SizedBox(width: 40.w,),
                Image.asset("assets/dashboard/msggrey.png",width:50.w),
                SizedBox(width: 40.w ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/dashboard/accountgrey.png",width:50.w),
                    SizedBox(width: 20.w ,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rajesh",style: GoogleFonts.lato(color:  Color(0xFF6683ED),fontSize:25.sp,fontWeight: FontWeight.bold ),),
                        Text("Marketing Administration",style: GoogleFonts.lato(color:  Colors.black54,fontSize:20.sp ),),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Row(
        children: <Widget>[
          // Side Drawer
          Container(
            width: 280.w, // Width of the side drawer
            color: Colors.white, // Background color of the drawer
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 40.h,horizontal: 10.w),
              children: <Widget>[
                Container(
                  height:110.h,
                  width: 80.w ,
                  decoration: BoxDecoration(
                      color:  _currentIndex==0?Color(0xFF6683ED):null,
                      borderRadius: BorderRadius.circular(10.w)
                  ),

                  child: Center(
                    child: ListTile(

                      title: Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:  EdgeInsets.only(bottom:25.h ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _currentIndex==0?  Image.asset("assets/dashboard/menuwhite.png",height: 55.h,):Image.asset("assets/dashboard/menugrey.png",height: 55.h,),
                                SizedBox(width: 10.w,),
                                Text("Dashboard",style: GoogleFonts.lato(fontSize: 24.sp ,color: _currentIndex==0?Colors.white:Color(0xFF6B6B6B) ,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _navigateToPage(0);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                Container(
                  height:110.h,
                  width: 80.w ,
                  decoration: BoxDecoration(
                      color:  _currentIndex==1?Color(0xFF6683ED):null,
                      borderRadius: BorderRadius.circular(10.w)
                  ),

                  child: Center(
                    child: ListTile(

                      title: Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:  EdgeInsets.only(bottom:25.h ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _currentIndex==1?  Image.asset("assets/dashboard/memberwhite.png",height: 55.h,):Image.asset("assets/dashboard/member.png",height:55.h,),
                                SizedBox(width: 10.w,),
                                Text("Users",style: GoogleFonts.lato(fontSize: 24.sp ,color: _currentIndex==1?Colors.white:Color(0xFF6B6B6B) ,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _navigateToPage(1);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                Container(
                  height:110.h,
                  width: 80.w ,
                  decoration: BoxDecoration(
                      color:  _currentIndex==2?Color(0xFF6683ED):null,
                      borderRadius: BorderRadius.circular(10.w)
                  ),

                  child: Center(
                    child: ListTile(

                      title: Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:  EdgeInsets.only(bottom:25.h ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _currentIndex==2?  Image.asset("assets/dashboard/eventwhite.png",height: 55.h,):Image.asset("assets/dashboard/event.png",height:55.h,),
                                SizedBox(width: 10.w,),
                                Text("Events",style: GoogleFonts.lato(fontSize: 24.sp ,color: _currentIndex==2?Colors.white:Color(0xFF6B6B6B) ,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _navigateToPage(2);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                Container(
                  height:110.h,
                  width: 80.w ,
                  decoration: BoxDecoration(
                      color:  _currentIndex==3?Color(0xFF6683ED):null,
                      borderRadius: BorderRadius.circular(10.w)
                  ),

                  child: Center(
                    child: ListTile(

                      title: Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:  EdgeInsets.only(bottom:25.h ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _currentIndex==3?  Image.asset("assets/dashboard/productwhite.png",height: 55.h,):Image.asset("assets/dashboard/product.png",height:55.h,),
                                SizedBox(width: 10.w,),
                                Text("Products",style: GoogleFonts.lato(fontSize: 24.sp ,color: _currentIndex==3?Colors.white:Color(0xFF6B6B6B) ,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _navigateToPage(3);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                Container(
                  height:110.h,
                  width: 80.w ,
                  decoration: BoxDecoration(
                      color:  _currentIndex==4?Color(0xFF6683ED):null,
                      borderRadius: BorderRadius.circular(10.w)
                  ),

                  child: Center(
                    child: ListTile(

                      title: Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:  EdgeInsets.only(bottom:25.h ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _currentIndex==4?  Image.asset("assets/dashboard/analyticswhite.png",height: 55.h,):Image.asset("assets/dashboard/analytics.png",height:55.h,),
                                SizedBox(width: 10.w,),
                                Text("Analytics",style: GoogleFonts.lato(fontSize: 24.sp ,color: _currentIndex==4?Colors.white:Color(0xFF6B6B6B) ,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _navigateToPage(4);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                Container(
                  height:110.h,
                  width: 80.w ,
                  decoration: BoxDecoration(
                      color:  _currentIndex==5?Color(0xFF6683ED):null,
                      borderRadius: BorderRadius.circular(10.w)
                  ),

                  child: Center(
                    child: ListTile(

                      title: Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:  EdgeInsets.only(bottom:25.h ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _currentIndex==5?  Image.asset("assets/dashboard/memberwhite.png",height: 55.h,):Image.asset("assets/dashboard/member.png",height:55.h,),
                                SizedBox(width: 10.w,),
                                Text("Members",style: GoogleFonts.lato(fontSize: 24.sp ,color: _currentIndex==5?Colors.white:Color(0xFF6B6B6B) ,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _navigateToPage(5);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                Container(
                  height:110.h,
                  width: 80.w ,
                  decoration: BoxDecoration(
                      color:  _currentIndex==6?Color(0xFF6683ED):null,
                      borderRadius: BorderRadius.circular(10.w)
                  ),

                  child: Center(
                    child: ListTile(

                      title: Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:  EdgeInsets.only(bottom:25.h ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _currentIndex==6?  Image.asset("assets/dashboard/feedbackwhite.png",height: 55.h,):Image.asset("assets/dashboard/feedback.png",height:55.h,),
                                SizedBox(width: 10.w,),
                                Text("Feedback",style: GoogleFonts.lato(fontSize: 24.sp ,color: _currentIndex==6?Colors.white:Color(0xFF6B6B6B) ,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _navigateToPage(6);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                Container(
                  height:110.h,
                  width: 80.w ,
                  decoration: BoxDecoration(
                      color:  _currentIndex==7?Color(0xFF6683ED):null,
                      borderRadius: BorderRadius.circular(10.w)
                  ),

                  child: Center(
                    child: ListTile(

                      title: Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:  EdgeInsets.only(bottom:25.h ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _currentIndex==7?  Image.asset("assets/dashboard/settingwhite.png",height: 55.h,):Image.asset("assets/dashboard/setting.png",height:55.h,),
                                SizedBox(width: 10.w,),
                                Text("Settings",style: GoogleFonts.lato(fontSize: 24.sp ,color: _currentIndex==7?Colors.white:Color(0xFF6B6B6B) ,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _navigateToPage(7);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 200.h,),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    height:50.h,
                    color:  Colors.white,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text("Teams",style: GoogleFonts.lato(fontSize: 25.sp,color:Colors.black54,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ) ,
                  ),
                ),
                SizedBox(height:60.h ,),

                GestureDetector(
                  onTap: (){

                  },
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      height:60.h,
                      color:  Colors.white,
                      child: Padding(
                        padding:  EdgeInsets.only(left:30.w),
                        child: Row(
                          children: [
                            Container(
                              height: 35.h,
                              width: 35.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF6683ED)
                              ),
                            ),
                            SizedBox(width:10.w,),
                            Text("Marketing",style: GoogleFonts.lato(fontSize: 22.sp,color:Colors.black),)
                          ],
                        ),
                      ) ,
                    ),
                  ),
                ),
                SizedBox(height:40.h,),
                GestureDetector(
                  onTap: (){

                  },
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      height:60.h,
                      color:  Colors.white,
                      child: Padding(
                        padding:  EdgeInsets.only(left:30.w ),
                        child: Row(
                          children: [
                            Container(
                              height: 35.h,
                              width: 35.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:  Color(0xFF68ED66)
                              ),
                            ),
                            SizedBox(width:10.w,),
                            Text("Development",style: GoogleFonts.lato(fontSize: 22.sp,color:Colors.black),)
                          ],
                        ),
                      ) ,
                    ),
                  ),
                ),
                SizedBox(height:40.h,),
                GestureDetector(
                  onTap: (){

                  },
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      height:60.h,
                      color:  Colors.white,
                      child: Padding(
                        padding:  EdgeInsets.only(left:30.w ),
                        child: Row(
                          children: [
                            Container(
                              height: 35.h,
                              width: 35.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:   Color(0xFFEDC766),
                              ),
                            ),
                            SizedBox(width:10.w ,),
                            Text("Activities & Tasks",style: GoogleFonts.lato(fontSize: 22.sp,color:Colors.black),)
                          ],
                        ),
                      ) ,
                    ),
                  ),
                ),
                SizedBox(height:300.h,),
                GestureDetector(
                  onTap: (){

                  },
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      height:60.h,
                      color:  Colors.white,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 30.w),
                        child: Row(
                          children: [
                            Image.asset("assets/dashboard/logouticon.png",height: 40.h),
                            SizedBox(width: 30.w,),
                            Text("LOGOUT",style: GoogleFonts.lato(fontSize:27.sp ,color: Color(0xFFF66D6D),fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ) ,
                    ),
                  ),
                )



                // Add more list items as needed
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: <Widget>[
                Dashboard(),
                Users(),
                Center(
                  child: Text('Widget 3'),
                ),
                Center(
                  child: Text('Widget 4'),
                ),
                Center(
                  child: Text('Widget 5'),
                ),
                Center(
                  child: Text('Widget 6'),
                ),
                Center(
                  child: Text('Widget 7'),
                ),
                Center(
                  child: Text('Widget 8'),
                ),
                // Add more widgets for different pages
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

