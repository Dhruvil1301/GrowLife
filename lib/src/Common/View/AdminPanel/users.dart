import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
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
                  child: Text("Users Performance",style: GoogleFonts.lato(fontSize:32.sp,fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 70.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserActivityChart(),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 40.w),
                    child: Container(
                      height: 250.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          color: Color(0xFFE1DFDF),
                          borderRadius: BorderRadius.circular(10.sp)

                      ),
                      child:  Padding(
                        padding:  EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                Text("Non Active user",style: GoogleFonts.lato(fontSize: 22.sp,color:Color(0xFF6B6B6B) ),),
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
                                Text("Active User",style: GoogleFonts.lato(fontSize: 22.sp,color:Color(0xFF6B6B6B) ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 35.h,horizontal: 20.w),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Users",style: GoogleFonts.lato(fontSize:32.sp,fontWeight: FontWeight.bold),)),
            ),
            Table()
    ]

        )
      ],
    );
  }
}



class Table extends StatefulWidget {
  @override
  State<Table> createState() => _TableState();
}

class _TableState extends State<Table> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1/2),
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: Column(
              children: [
                buildHeaderRow(),
                Divider(height: 1, thickness: 0),
                buildDataRow('1', 'Emily Johnson', 'Online', 'emilyjohnson@gmail.com'),
                Divider(height: 1, thickness: 0),
                buildDataRow('2', 'Daniel Martinez', 'Offline', 'daniel123@gmail.com'),
                Divider(height:1 , thickness: 0),
                buildDataRow('3', 'Sophia Williams', 'Online', 'sophia2004@gmail.com'),
                Divider(height:1 , thickness: 0),
                buildDataRow('4', 'Liam Anderson', 'Online', 'liamanderson@gmail.com'),
                Divider(height:1 , thickness: 0),
                buildDataRow('5', 'Ava Thompson', 'Online', 'Ava1204@gmail.com'),
                // Add more data rows as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeaderRow() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp),topLeft:Radius.circular(20.sp)),
        color: Colors.grey[200],
      ),
      padding: EdgeInsets.symmetric(vertical:20.h),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'S.No',
              style: GoogleFonts.lato(fontSize: 25.sp,fontWeight: FontWeight.bold,color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          VerticalDivider(thickness: 0),
          Expanded(
            flex: 2,
            child: Text(
              'Username',
              style: GoogleFonts.lato(fontSize: 25.sp,fontWeight: FontWeight.bold,color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          VerticalDivider(thickness: 0),
          Expanded(
            flex: 2,
            child: Text(
              'Status',
              style: GoogleFonts.lato(fontSize: 25.sp,fontWeight: FontWeight.bold,color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          VerticalDivider(),
          Expanded(
            flex: 2,
            child: Text(
              'Email',
              style: GoogleFonts.lato(fontSize: 25.sp,fontWeight: FontWeight.bold,color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          VerticalDivider(thickness: 0),
          Expanded(
            flex: 1,
            child: Text(
              '',
              style: GoogleFonts.lato(fontSize: 22.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDataRow(String sNo, String username, String status, String email) {
    Color statusColor = status == 'Online' ? Color(0xFF5EC349) : Colors.grey;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              sNo,
              style: GoogleFonts.lato(fontSize: 22.sp,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          VerticalDivider(thickness: 0, color: Colors.black),
          Expanded(
            flex: 2,
            child: Text(
              username,
              style: GoogleFonts.lato(fontSize: 22.sp,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          VerticalDivider(thickness: 0, color: Colors.black),
          Expanded(
            flex: 2,
            child: Text(
              status,
              style: GoogleFonts.lato(fontSize: 22.sp,color: statusColor,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          VerticalDivider(thickness: 0, color: Colors.black),
          Expanded(
            flex: 2,
            child: Text(
              email,
              style: GoogleFonts.lato(fontSize: 22.sp,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          VerticalDivider(thickness: 0, color: Colors.black),
          Expanded(
            flex: 1,
            child:  Center(
                child: Container(
                  height: 70.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Color(0xFF2929).withOpacity(.5),
                  ),
                  child: Center(child: Text("DELETE",style: GoogleFonts.lato(fontSize: 18.sp,color:  Colors.red,fontWeight: FontWeight.bold),)),
                ),
              ),
            )

        ],
      ),
    );
  }
}

class UserActivityChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900.h,
      width: 1200.w,// Adjust the height as needed
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              axisNameWidget: Text("Percentage (%)",style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
              axisNameSize: 25.sp,
              sideTitles: SideTitles(
                showTitles: true,

                interval: 10,
                reservedSize: 40

              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  String text = '';
                  switch (value.toInt()) {
                    case 0:
                      text = 'Jan';
                      break;
                    case 1:
                      text = 'Feb';
                      break;
                    case 2:
                      text = 'Mar';
                      break;
                    case 3:
                      text = 'Apr';
                      break;
                    case 4:
                      text = 'May';
                      break;
                    case 5:
                      text = 'Jun';
                      break;
                    case 6:
                      text = 'Jul';
                      break;
                    case 7:
                      text = 'Aug';
                      break;
                    case 8:
                      text = 'Sep';
                      break;
                    case 9:
                      text = 'Oct';
                      break;
                    case 10:
                      text = 'Nov';
                      break;
                    case 11:
                      text = 'Dec';
                      break;
                    default:
                      text = '';
                      break;
                  }
                  return Text(
                    text,
                    style: GoogleFonts.lato(fontSize: 18.sp), // Adjust the font size as needed
                  );
                },
              ),
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
              )
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: 15, // Percentage for active users in January
                  color: Color(0xFF18A0FB),
                  width: 30.w

                ),
                BarChartRodData(
                  toY: 80, // Percentage for non-active users in January
                  color: Color(0xFFFF8A00),
                  width: 30.w
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: 30, // Percentage for active users in February
                  color: Color(0xFF18A0FB),
                  width: 30.w,

                ),
                BarChartRodData(
                  toY: 70, // Percentage for non-active users in February
                  color: Color(0xFFFF8A00),
                  width: 30.w,
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: 25, // Percentage for active users in March
                  color: Color(0xFF18A0FB),
                  width: 30.w,
                ),
                BarChartRodData(
                  toY: 75, // Percentage for non-active users in March
                  color: Color(0xFFFF8A00),
                  width: 30.w,
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  toY: 15, // Percentage for active users in January
                  color: Color(0xFF18A0FB),
                  width: 30.w,
                ),
                BarChartRodData(
                  toY: 70, // Percentage for non-active users in January
                  color: Color(0xFFFF8A00),
                  width: 30.w,
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  toY: 50, // Percentage for active users in February
                  color: Color(0xFF18A0FB),
                  width: 30.w,
                ),
                BarChartRodData(
                  toY: 70, // Percentage for non-active users in February
                  color: Color(0xFFFF8A00),
                  width: 30.w,
                ),
              ],
            ),
            BarChartGroupData(
              x: 5,
              barRods: [
                BarChartRodData(
                  toY: 35, // Percentage for active users in March
                  color: Color(0xFF18A0FB),
                  width: 30.w,
                ),
                BarChartRodData(
                  toY: 80, // Percentage for non-active users in March
                  color: Color(0xFFFF8A00),
                  width: 30.w,
                ),
              ],
            ),
            BarChartGroupData(
              x: 6,
              barRods: [
                BarChartRodData(
                  toY: 20, // Percentage for active users in January
                  color: Color(0xFF18A0FB),
                  width: 30.w,
                ),
                BarChartRodData(
                  toY: 70, // Percentage for non-active users in January
                  color: Color(0xFFFF8A00),
                  width: 30.w,
                ),
              ],
            ),
            BarChartGroupData(
              x: 7,
              barRods: [
                BarChartRodData(
                  toY: 30, // Percentage for active users in February
                  color: Color(0xFF18A0FB),
                  width: 30.w,
                ),
                BarChartRodData(
                  toY: 70, // Percentage for non-active users in February
                  color: Color(0xFFFF8A00),
                  width: 30.w,
                ),
              ],
            ),
            BarChartGroupData(
              x: 8,
              barRods: [
                BarChartRodData(
                  toY: 40, // Percentage for active users in March
                  color: Color(0xFF18A0FB),
                  width: 30.w,
                ),
                BarChartRodData(
                  toY: 75, // Percentage for non-active users in March
                  color: Color(0xFFFF8A00),
                  width: 30.w,
                ),
              ],
            ),
            BarChartGroupData(
              x: 9,
              barRods: [
                BarChartRodData(
                  toY: 35, // Percentage for active users in January
                  color: Color(0xFF18A0FB),
                  width: 30.w,
                ),
                BarChartRodData(
                  toY: 55, // Percentage for non-active users in January
                  color: Color(0xFFFF8A00),
                  width: 30.w,
                ),
              ],
            ),
            BarChartGroupData(
              x: 10,
              barRods: [
                BarChartRodData(
                  toY: 50, // Percentage for active users in February
                  color: Color(0xFF18A0FB),
                  width: 30.w,
                ),
                BarChartRodData(
                  toY: 80, // Percentage for non-active users in February
                  color: Color(0xFFFF8A00),
                  width: 30.w,
                ),
              ],
            ),
            BarChartGroupData(
              x: 11,
              barRods: [
                BarChartRodData(
                  toY: 35, // Percentage for active users in March
                  color: Color(0xFF18A0FB),
                  width: 30.w,
                ),
                BarChartRodData(
                  toY: 65, // Percentage for non-active users in March
                  color: Color(0xFFFF8A00),
                  width: 30.w,
                ),
              ],
            ),

            // Continue adding data for April to December
            // You can use a loop to generate this data to avoid redundancy
          ],
        ),
      ),
    );
  }
}

