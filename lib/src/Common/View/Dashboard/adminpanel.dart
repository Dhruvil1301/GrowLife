import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
                ListView(

                    children:[ Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset("assets/dashboard/desktopadminwelcom.png",width:1650.w ,),
                              Positioned(child:
                              Column(
                                children: [
                                  Text("Welcome to GrowLife",style: GoogleFonts.lato(fontSize: 40.sp,fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: 3),),
                                  SizedBox(height:30.h,),
                                  Text("Hello Rajesh! Welcome Back",style: GoogleFonts.lato(fontSize: 30.sp,fontWeight: FontWeight.bold,color: Colors.black54,letterSpacing: 3),),
                                ],
                              )
                              ),
                            ],
                          ),

                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 35.h,horizontal: 20.w),
                            child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Text("Dashboard",style: GoogleFonts.lato(fontSize:32.sp,fontWeight: FontWeight.bold),)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 80.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height:600.h,
                                  width: 280.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.sp),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                        ),
                                      ]
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.only(top:40.h,left:20.w,right:20.w),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional.topStart,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  CircularPercentIndicator(radius: 50.sp,
                                                    backgroundColor: Colors.white,
                                                    progressColor:  Color(0xFFF76D6D),
                                                    lineWidth: 8,
                                                    percent: .7,
                                                    circularStrokeCap: CircularStrokeCap.round,
                                                  ),
                                                  Text(
                                                    '70%', // Your text here
                                                    style: GoogleFonts.lato(
                                                        fontSize:32.sp , // Adjust the font size as needed

                                                        color: Colors.black
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Image.asset("assets/dashboard/sales.png",height:80.h,)
                                          ],
                                        ),
                                        SizedBox(height: 30.h,),
                                        Text("Sales",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 38.sp),),
                                        SizedBox(height: 20.h,),
                                        Text("\$25,970",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 35.sp),),
                                        SizedBox(height: 30.h,),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text("Last 24 hours",style: GoogleFonts.lato(fontSize: 20.sp ,fontWeight: FontWeight.bold),))



                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width:50.w ,),
                                Container(
                                  height:600.h,
                                  width: 280.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.sp),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                        ),
                                      ]
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.only(top:40.h,left:20.w,right:20.w),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional.topStart,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  CircularPercentIndicator(radius: 50.sp,
                                                    backgroundColor: Colors.white,
                                                    progressColor: Color(0xFFEDC766) ,
                                                    lineWidth: 8,
                                                    percent: .8,
                                                    circularStrokeCap: CircularStrokeCap.round,
                                                  ),
                                                  Text(
                                                    '80%', // Your text here
                                                    style: GoogleFonts.lato(
                                                        fontSize: 32.sp, // Adjust the font size as needed

                                                        color: Colors.black
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Image.asset("assets/dashboard/revenue.png",height:80.h)
                                          ],
                                        ),
                                        SizedBox(height: 30.h,),
                                        Text("Revenue",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  38.sp),),
                                        SizedBox(height: 20.h,),
                                        Text("\$14,270",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:  35.sp),),
                                        SizedBox(height: 30.h,),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text("Last 24 hours",style: GoogleFonts.lato(fontSize:  20.sp,fontWeight: FontWeight.bold),))



                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width:50.w ,),
                                Container(
                                  height:600.h,
                                  width: 280.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.sp),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                        ),
                                      ]
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.only(top:40.h,left:20.w,right:20.w),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional.topStart,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  CircularPercentIndicator(radius: 50.sp,
                                                    backgroundColor: Colors.white,
                                                    progressColor: Color(0xFF68ED66),
                                                    lineWidth: 8,
                                                    percent: .6,
                                                    circularStrokeCap: CircularStrokeCap.round,
                                                  ),
                                                  Text(
                                                    '60%', // Your text here
                                                    style: GoogleFonts.lato(
                                                        fontSize:32.sp , // Adjust the font size as needed

                                                        color: Colors.black
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Image.asset("assets/dashboard/expences.png",height:80.h,)
                                          ],
                                        ),
                                        SizedBox(height:30.h,),
                                        Text("Expences",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 38.sp),),
                                        SizedBox(height: 20.h,),
                                        Text("\$4,270",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 35.sp),),
                                        SizedBox(height: 30.h,),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text("Last 24 hours",style: GoogleFonts.lato(fontSize: 20.sp,fontWeight: FontWeight.bold),))



                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width:50.w ,),
                                Container(
                                  height:600.h,
                                  width: 280.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.sp),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                        ),
                                      ]
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.only(top:40.h,left:20.w,right:20.w),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional.topStart,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  CircularPercentIndicator(radius: 50.sp,
                                                    backgroundColor: Colors.white,
                                                    progressColor:Color(0xFF18A0FB) ,
                                                    lineWidth: 8,
                                                    percent: .8,
                                                    circularStrokeCap: CircularStrokeCap.round,
                                                  ),
                                                  Text(
                                                    '80%', // Your text here
                                                    style: GoogleFonts.lato(
                                                        fontSize:32.sp, // Adjust the font size as needed

                                                        color: Colors.black
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Image.asset("assets/dashboard/usersicon.png",height:80.h,)
                                          ],
                                        ),
                                        SizedBox(height:30.h,),
                                        Text("User",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:38.sp),),
                                        SizedBox(height: 20.h,),
                                        Text("240",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 35.sp),),
                                        SizedBox(height: 30.h,),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text("Last 4 hours",style: GoogleFonts.lato(fontSize:20.sp,fontWeight: FontWeight.bold),))



                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height:30.h ,),
                          Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text("Recently Payments",style: GoogleFonts.lato(fontSize:32.sp,fontWeight: FontWeight.bold),)),
                          SizedBox(height:30.h ,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int i = 0; i < 4; i++)
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30.w,
                                      vertical:50.h,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Container(
                                        height: 260.h,
                                        width: 450.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15.sp),
                                          border: Border.all(
                                            color: Colors.black26,
                                            width: 1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 40.h,
                                            right: 10.w,
                                            left: 10.w,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    "assets/dashboard/avadevis.png",
                                                    height: 120.h,
                                                  ),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Ava Davis",
                                                        style: GoogleFonts.lato(fontSize: 25.sp),
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Text(
                                                        "22-08-2023",
                                                        style: GoogleFonts.lato(
                                                          fontSize: 20.sp,
                                                          color: Colors.black26,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  i == 2
                                                      ? SizedBox(
                                                    width:90.w,
                                                  )
                                                      : SizedBox(
                                                    width: 120.w,
                                                  ),
                                                  i == 2
                                                      ? Container(
                                                    height:
                                                    70.h,
                                                    width: 130.w,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEDC766).withOpacity(0.3),
                                                      borderRadius: BorderRadius.circular(20.sp),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "PENDING",
                                                        style: GoogleFonts.lato(
                                                          color: Color(0xFFEDC766),
                                                          fontSize: 20.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                      : Container(
                                                    height:  70.h,
                                                    width: 100.w,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF29B927).withOpacity(0.3),
                                                      borderRadius: BorderRadius.circular(20.sp),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "DONE",
                                                        style: GoogleFonts.lato(
                                                          color: Color(0xFF29B927),
                                                          fontSize: 20.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Align(
                                                alignment: Alignment.bottomRight,
                                                child: Text(
                                                  "\$25,970",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 25.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: i == 2 ? Color(0xFFEDC766) : Color(0xFF29B927),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height:30.h ,),
                          Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Row(

                                children: [
                                  Text("Performance",style: GoogleFonts.lato(fontSize:32.sp,fontWeight: FontWeight.bold),),
                                  SizedBox(width:730.w),
                                  Text("Updates",style: GoogleFonts.lato(fontSize:32.sp,fontWeight: FontWeight.bold),),
                                ],
                              )),
                          SizedBox(height:100.h ,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LineChartSample(),
                              Column(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 30.w),
                                    child: Container(
                                      height: 70.h,
                                      width: 130.w,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE1DFDF),
                                          borderRadius: BorderRadius.circular(10.sp)

                                      ),
                                      child: Center(child: Text("21-27 Aug",style: GoogleFonts.lato(fontSize: 22.sp,color:Color(0xFF6B6B6B) ),)),
                                    ),
                                  ),
                                  SizedBox(height: 40.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 30.w),
                                    child: Container(
                                      height: 250.h,
                                      width: 150.w,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE1DFDF),
                                          borderRadius: BorderRadius.circular(10.sp)

                                      ),
                                      child:  Padding(
                                        padding:  EdgeInsets.symmetric(vertical: 15.h),
                                        child: Column(
                                          children: [
                                            Text("22 Aug 2023",style: GoogleFonts.lato(fontSize: 22.sp,color:Colors.black ),),
                                            SizedBox(height: 20.h,),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 25.h,
                                                  width: 25.w,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFFF8A00),
                                                  ),
                                                ),
                                                Text("This Month",style: GoogleFonts.lato(fontSize: 22.sp,color:Color(0xFF6B6B6B) ),),
                                              ],
                                            ),
                                            SizedBox(height: 20.h,),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 25.h,
                                                  width: 25.w,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFF18A0FB),
                                                  ),
                                                ),
                                                Text("Last Month",style: GoogleFonts.lato(fontSize: 22.sp,color:Color(0xFF6B6B6B) ),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: 90.w),
                                child: Container(
                                  width: 600.w,
                                  height: 1000.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.sp),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(.3),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                        ),

                                      ]
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 50.w,vertical: 50.h),
                                    child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          for(int i=0;i<4;i++)
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset("assets/dashboard/james.png",height: 150.h,),
                                                    SizedBox(width: 20.w,),
                                                    Expanded(
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: 'James',
                                                              style: GoogleFonts.lato(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 25.sp,
                                                                color: Colors.black, // You can set your desired color
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' has ordered Rubber Plant & Peace Lily',
                                                              style: GoogleFonts.lato(
                                                                fontSize: 25.sp,
                                                                color: Colors.black, // You can set your desired color
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:  EdgeInsets.symmetric(horizontal:80.w ),
                                                  child: Align(
                                                      alignment: AlignmentDirectional.topStart,
                                                      child: Text("25 seconds ago",style: GoogleFonts.lato(color: Colors.black38,fontSize: 23.sp),)),
                                                )
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )


                            ],
                          ),


                        ]
                    ),
                    ]
                ),

                Center(
                  child: Text('Widget 2'),
                ),
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
class LineChartSample extends StatefulWidget {
  @override
  State<LineChartSample> createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000.h, // Adjust the height as needed
      width: 600.w, // Adjust the width as needed
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                axisNameWidget:Text("Time( in Hours)",style:GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 23.sp,letterSpacing: 2),) ,
                axisNameSize: 23.sp,

                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 3,
                  reservedSize: 35,

                ),
                // Set the interval between vertical labels
              ),
              rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  )
              ),
              topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  )
              ),
              bottomTitles: AxisTitles(
                axisNameWidget:Text("Date",style: GoogleFonts.lato(fontWeight: FontWeight.bold,letterSpacing: 2),) ,
                axisNameSize: 23.sp,

                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 35,
                  interval: 01,
                ),
                // Set the interval between horizontal labels
              ),
            ),
            borderData: FlBorderData(
              show: false,

            ),
            minX: 21,
            maxX: 27, // Adjust the maximum X value as needed
            minY: 0,
            maxY: 24, // Adjust the maximum Y value as needed
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(21, 5),
                  FlSpot(22, 8),
                  FlSpot(23, 4),
                  FlSpot(24, 7),
                  FlSpot(25, 11),
                  FlSpot(26, 7),
                  FlSpot(27, 12),
                ],
                isCurved: true,
                color: Color(0xFF18A0FB),
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
              LineChartBarData(
                spots: [
                  FlSpot(21, 11),
                  FlSpot(22, 9),
                  FlSpot(23, 12),
                  FlSpot(24, 5),
                  FlSpot(25, 3),
                  FlSpot(26, 9),
                  FlSpot(27, 10),
                ],
                isCurved: true,
                color:  Color(0xFFFF8A00),
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
