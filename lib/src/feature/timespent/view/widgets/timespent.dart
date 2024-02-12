import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/res/color.dart';

class TimeSpent extends StatelessWidget {
  const TimeSpent({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 360,
        width: 360, // Adjust the height as needed
        child: BarChart(
          BarChartData(
            gridData: const FlGridData(show: false),
            titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  axisNameSize: 25,
                  sideTitles:  SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                      String text = '';
                      switch (value.toInt()) {
                        case 60:
                          text="60m";
                          break;
                        case 120:
                          text="120m";
                          break;

                        case 180:
                          text="180m";
                          break;
                        default:
                          text="";
                          break;
                      }
                      return Text(
                        text,
                        style: GoogleFonts.inter(fontSize: 13), // Adjust the font size as needed
                      );
                    },

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
                          text = 'S';
                          break;
                        case 1:
                          text = 'M';
                          break;
                        case 2:
                          text = 'T';
                          break;
                        case 3:
                          text = 'W';
                          break;
                        case 4:
                          text = 'T';
                          break;
                        case 5:
                          text = 'F';
                          break;
                        case 6:
                          text = 'S';
                          break;
                        default:
                          text = '';
                          break;
                      }
                      return Text(
                        text,
                        style: GoogleFonts.inter(fontSize: 13), // Adjust the font size as needed
                      );
                    },
                  ),
                ),
                rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    )
                ),
                topTitles: const AxisTitles(
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
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                      toY: 65, // Percentage for active users in January
                      color: AppColor.greenColor,
                      width: 40

                  ),

                ],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                    toY: 125, // Percentage for active users in February
                    color:  AppColor.greenColor,
                    width: 40,

                  ),

                ],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                    toY: 115, // Percentage for active users in March
                    color:  AppColor.greenColor,
                    width: 40,
                  ),
                ],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                    toY: 180, // Percentage for active users in January
                    color:   AppColor.greenColor,
                    width: 40,
                  ),

                ],
              ),
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                    toY: 110, // Percentage for active users in February
                    color:  AppColor.greenColor,
                    width: 40,
                  ),

                ],
              ),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                    toY: 185, // Percentage for active users in March
                    color:  AppColor.greenColor,
                    width:40,
                  ),

                ],
              ),
              BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                    toY: 115, // Percentage for active users in January
                    color:AppColor.barColor,
                    width: 40,
                  ),

                ],
              ),


              // Continue adding data for April to December
              // You can use a loop to generate this data to avoid redundancy
            ],
          ),
        ),
      ),
    );
  }
}