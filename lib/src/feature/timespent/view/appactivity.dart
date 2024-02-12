import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/timespent/view/widgets/timespent.dart';
import 'package:growlife/src/res/color.dart';

class AppActivity extends StatelessWidget {

  const AppActivity({Key? key}) : super(key: key);
  static const routePath="/timespent";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CommonAppBar(
        title: "App Activity",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Time Spent",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 19),),
                  Row(
                    children: [
                      Text("This Week",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.black45),),
                      const Icon(Icons.expand_more,size: 25,),
                    ],
                  ),

                ],
              ),
            ),
            const SizedBox(height: 10,),
            const TimeSpent(),
            Text("2h 38m",style: GoogleFonts.lato(fontSize: 32,fontWeight: FontWeight.w400),),
            Text("Daily Average",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w600),),
            Text("Average time you spent per day using the Growlife app\n on this device in the last week",style: GoogleFonts.lato(fontSize: 11,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}

