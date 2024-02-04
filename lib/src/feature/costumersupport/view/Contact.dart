import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/aboutus/view/widgets/bottomContainer.dart';
import 'package:growlife/src/feature/costumersupport/view/widgets/contactfields.dart';
import 'package:growlife/src/res/assets.dart';

class ContactUs extends StatelessWidget {

  const ContactUs({Key? key}) : super(key: key);
  static const routePath="/contactus";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(title: "Contact Us",),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Image.asset(ImageAssets.contactus),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 1,
                          color: Colors.grey.withOpacity(.5),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Contact Us",
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "If you have any questions, feedback, or need\n assistance, we'd love to hear from you!\n Our dedicated support team is here to help.",
                                style:GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ContactInfoRow(
                                icon: EvaIcons.phone,
                                text: "+91 8765409862",
                              ),
                              const SizedBox(height: 5,),
                              ContactInfoRow(
                                icon: EvaIcons.email,
                                text: "xyzlife@gmail.com",
                              ),
                              const SizedBox(height: 5,),
                              ContactInfoRow(
                                icon: EvaIcons.pin,
                                text: "Delhi, India",
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ContactFormField(label: "Name"),
                              ContactFormField(label: "Email"),
                              ContactFormField(label: "Subject"),
                              ContactFormField(label: "Message", maxLines: 5),
                              const SizedBox(height: 20),
                              Center(
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF1F588E),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          "Send Message",
                                          style: GoogleFonts.lato(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF1F588E),
                                          boxShadow: [
                                            BoxShadow(
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              color: Colors.blueGrey,
                                            )
                                          ],
                                        ),
                                        child: Center(
                                          child: Transform.rotate(
                                            angle: -30 * (3.141592653589793 / 180),
                                            child: const Icon(
                                              Icons.send,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const BottomContainer()
          ],
        ),
      ),
    );
  }
}

