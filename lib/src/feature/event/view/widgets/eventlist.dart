import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class EventList extends StatelessWidget {
  final String image;
  final String time;
  final String title;
  final String location;
  final VoidCallback? onTap;
  const EventList({Key? key, required this.image, required this.time, required this.title, required this.location, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery
              .of(context)
              .size
              .height * .01, vertical: MediaQuery
              .of(context)
              .size
              .height * .01),
          child: InkWell(
            onTap: () {
              onTap?.call();
            },
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Padding(
                    padding: EdgeInsets.only(right: MediaQuery
                        .of(context)
                        .size
                        .height * 0.006),
                    child: Image.asset(
                     image,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.12,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.35,
                    ),
                  ),

                     Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: AlignmentDirectional
                                  .topStart,
                              child: Text(
                                time,
                                style: GoogleFonts.roboto(
                                    color: Colors.black38,
                                    fontSize:14),)),
                          SizedBox(height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.008,),
                          Text(
                           title,
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize:16),),
                          SizedBox(height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.008,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .start,
                            children: [
                              Icon(Icons.location_on,
                                color: Colors.red.shade600,
                                size: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.03,),
                              Text(location,
                                style: GoogleFonts.roboto(
                                    color: Colors.black38,
                                    fontSize: 14),)
                            ],
                          )
                        ],
                      ),
                    ),


                  ]
              ),
            ),
          ),
        ),
      ],
    );
  }
}
