import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/Navigationobjects/shop/myorder.dart';
import 'package:growlife/Navigationobjects/shop/orderdetail.dart';
import 'package:growlife/screen/homescreen.dart';
class AddFeedback extends StatefulWidget {
  const AddFeedback({Key? key}) : super(key: key);

  @override
  State<AddFeedback> createState() => _AddFeedbackState();
}

class _AddFeedbackState extends State<AddFeedback> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrder()));
            },
                child: Icon(Icons.close,color: Colors.black54,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.032,),
            Text("ADD FEEDBACK",style: GoogleFonts.lato(color: Color(0xFF1F588E),fontSize:  MediaQuery.of(context).size.height*.025,),),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.025 ),
              child: Column(

                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.02 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/shop/fiddleleaf.png",height: MediaQuery.of(context).size.height*.1,width:MediaQuery.of(context).size.width*.215 ,),
                      SizedBox(width:  MediaQuery.of(context).size.width*.03,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Fiddle leaf fig",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020,fontWeight: FontWeight.bold ),),
                          SizedBox(height: MediaQuery.of(context).size.height*.013 ,),

                              Text("Rate this product",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.022, ),),
                          SizedBox(height: MediaQuery.of(context).size.height*.013 ,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _rating = index + 1;
                                  });
                                },
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(
                                    index < _rating ? Icons.star : Icons.star_border,
                                    color: index<_rating ?Color.fromRGBO(255, 215, 0, 1.0):Colors.black38,
                                    size: 36.0,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01 ,),

                ],
              ),
            ),
            Container(
              height:MediaQuery.of(context).size.height*.0005 ,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.black38,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025,vertical:MediaQuery.of(context).size.height*.015 ),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Add Photo or Video",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022,fontWeight: FontWeight.bold ),)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.05 ),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.05,
                        width: MediaQuery.of(context).size.width*.35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: .5,
                            color: Colors.black54,
                          )
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Add Photo",style: GoogleFonts.lato(color:  Color(0xFF1F588E),fontSize: MediaQuery.of(context).size.height*.02,fontWeight: FontWeight.bold ),),
                              SizedBox(width:MediaQuery.of(context).size.height*.005 ,),
                              Icon(Icons.camera_alt_outlined,size:MediaQuery.of(context).size.height*.030,color:Color(0xFF1F588E) ,)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*.05,
                        width: MediaQuery.of(context).size.width*.35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: .5,
                              color: Colors.black54,
                            )
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Add Video",style: GoogleFonts.lato(color:  Color(0xFF1F588E),fontSize: MediaQuery.of(context).size.height*.02,fontWeight: FontWeight.bold ),),
                              SizedBox(width:MediaQuery.of(context).size.height*.005 ,),
                              Icon(EvaIcons.videoOutline,size:MediaQuery.of(context).size.height*.030,color:Color(0xFF1F588E) ,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
            ),
            ),
            SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025,vertical:MediaQuery.of(context).size.height*.015 ),
              child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Write a Review",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022,fontWeight: FontWeight.bold ),)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black26
                )

              ),
              child: TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'How was the product ?',
                  hintStyle: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020 ),
                  contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02, vertical:  MediaQuery.of(context).size.height*.018),
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.025,vertical: MediaQuery.of(context).size.height*.025 ),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    _feedback(context);
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.32,
                      height: MediaQuery.of(context).size.height*.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(int.parse('0xFF1F588E')),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Send",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.025,color: Colors.white )),
                          SizedBox(width:MediaQuery.of(context).size.width*.03 ,),
                          Transform.rotate(
                            angle: -30 * (3.141592653589793 / 180),
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _feedback(BuildContext context) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.03,

                    ),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.close,
                                      size:
                                      MediaQuery.of(context).size.height * 0.04,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width * 0.02),
                                  Text(
                                    "Feedback",
                                    style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                      MediaQuery.of(context).size.height * 0.028,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Text(
                                "We value your feedback! Please let us",
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                              ),
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.008),
                              Text(
                                "know how we can improve your",
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                              ),
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.008),
                              Text(
                                "experience.",
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                    MediaQuery.of(context).size.height * 0.018),
                              ),
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.015),
                              Text(
                                "Rate Us",
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                    MediaQuery.of(context).size.height * 0.021),
                              ),
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.008),
                              StarRating(),
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.01),
                              Text(
                                "Tell us more",
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                    MediaQuery.of(context).size.height * 0.021),
                              ),
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.01),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    )
                                  ]

                                ),
                                child: TextFormField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'How we can improve ?',
                                    hintStyle: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.020 ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02, vertical:  MediaQuery.of(context).size.height*.018),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.015),
                              Center(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      height: MediaQuery.of(context).size.height*.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFF1F95D8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.8),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Send Feedback",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.025,color: Colors.white )),
                                          SizedBox(width:MediaQuery.of(context).size.width*.03 ,),
                                          Transform.rotate(
                                            angle: -30 * (3.141592653589793 / 180),
                                            child: Icon(
                                              Icons.send,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
class StarRating extends StatefulWidget {
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _star = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _star = index + 1;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              index < _star ? Icons.star : Icons.star_border,
              color: index < _star
                  ? Color.fromRGBO(255, 215, 0, 1.0)
                  : Colors.black38,
              size: 36.0,
            ),
          ),
        );
      }),
    );
  }
}
