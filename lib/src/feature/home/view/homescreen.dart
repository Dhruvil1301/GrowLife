
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/event/view/events.dart';
import 'package:growlife/src/feature/home/view/widgets/Home.dart';
import 'package:growlife/src/feature/post/view/camera.dart';
import 'package:growlife/src/feature/shopping/view/shopping.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';

class HomeScreen extends StatefulWidget {
  static const routePath = "/homescreen";


  const HomeScreen({Key? key,}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      Home(),
      const Shopping(),
      Camera(),
      const Events(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        _feedback(context);
        return true;
      },
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Visibility(
          // Show or hide the bottom navigation bar based on the selectedIndex
          visible: _selectedIndex != 2,
          child: BottomAppBar(
            elevation: 0,
            height: 100,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem("HOME", 0, IconAssets.homewhite, IconAssets.home),
                _buildNavItem("SHOP", 1, IconAssets.shopwhite, IconAssets.shop),
                _buildNavItem("POST", 2, IconAssets.addwhite, IconAssets.add),
                _buildNavItem("EVENT", 3, IconAssets.eventwhite, IconAssets.event),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      String label,
      int index,
      String selectedImageAsset,
      String unselectedImageAsset,
      ) {
    bool isSelected = _selectedIndex == index;
    double translateY = isSelected ? -35.0 : -0.0; // Move icon up when selected

    return GestureDetector(
      onTap: () {
        // Update the selected index when an icon is tapped
        setState(() {
          _selectedIndex = index;
        });

        if (index == 2) {
          // Schedule the navigation to the Camera widget using pushReplacement to remove the home screen from the stack
          Future.delayed(Duration.zero, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  Camera()),
            ).then((value) {
              // Handle navigation back from Camera widget
              if (value != null && value is int && value == 0) {
                // If value is 0, set the selectedIndex to 0 (Home)
                setState(() {
                  _selectedIndex = 0;
                });
              }
            });
          });
        }
      },
      child: Transform.translate(
        offset: Offset(0, translateY),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: isSelected ? AppColor.primary : Colors.transparent,
              radius: 25,
              child: Image.asset(
                isSelected ? selectedImageAsset : unselectedImageAsset,
                width: 25,
                height: 25,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: GoogleFonts.montserrat(
                color: isSelected ? AppColor.primary : Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future _feedback(BuildContext context) async {
    int _rating=0;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 0,
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
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
                                    child: const Icon(
                                      Icons.close,
                                      size:25,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width * 0.025),
                                  Text(
                                    "Feedback",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize:20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Text(
                                "We value your feedback! Please let us \nknow how we can improve your \nexperience.",
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
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize:16),
                              ),
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.008),
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
                                      padding:  const EdgeInsets.symmetric(horizontal: 5),
                                      child: Icon(
                                        index < _rating ? Icons.star : Icons.star_border,
                                        color: index<_rating ?const Color.fromRGBO(255, 215, 0, 1.0):Colors.black38,
                                        size: 36.0,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.01),
                              Text(
                                "Tell us more",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize:16),
                              ),
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.005),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
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
                                      hintStyle: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w600),
                                      contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*.02, vertical:  MediaQuery.of(context).size.height*.018),
                                      border: InputBorder.none,
                                    ),
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
                                      height: MediaQuery.of(context).size.height*.05,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFF1F95D8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.8),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child:  Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Send Feedback",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w500
                                                ,fontSize:18,color: Colors.white )),
                                            SizedBox(width:MediaQuery.of(context).size.width*.03 ,),
                                            Transform.rotate(
                                              angle: -30 * (3.141592653589793 / 180),
                                              child: const Icon(
                                                Icons.send,
                                                color: Colors.white,
                                                size: 22,
                                              ),
                                            ),
                                          ],
                                        ),
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
