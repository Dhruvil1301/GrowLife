import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/order/view/widgets/ordersummary.dart';
import 'package:growlife/src/feature/shopping/view/widgets/paymentmethodicon.dart';
import 'package:growlife/src/feature/tracking/view/tracking.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
class PaymentMethod extends StatefulWidget {

  const PaymentMethod({Key? key}) : super(key: key);
  static const routePath="/paymentmethod";
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

  String imageUrl = ShopAssets.payment;
  List<String> imageUrls = [ShopAssets.payment,ShopAssets.paymentsuccess];
  int currentIndex = 0;

  void changeImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imageUrls.length;
      imageUrl = imageUrls[currentIndex];
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                  child: InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                    child: Icon(Icons.close,size: 20,))),
             ConfirmImage(),
              SizedBox(height:MediaQuery.of(context).size.height*.012 ,),
              Text("Order Confirmed",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w500,fontSize:22 ),),
              SizedBox(height:MediaQuery.of(context).size.height*.012 ,),
              Text("Order no: 1000205",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w500,fontSize:22 ),),
              SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
              Text('Your order has been confirmed \n will be delivered soon ',style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w400,fontSize:16 ),textAlign: TextAlign.center,),

            ],
          ),
          actions: <Widget>[
            Padding(
              padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.04),
              child: Center(
                child: InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Tracking()));
                 },
                  child: Container(
                    height:MediaQuery.of(context).size.height*.055 ,
                    width: MediaQuery.of(context).size.width*.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.01),
                      color: AppColor.lightGreenColor,
                    ),
                    child: Center(
                      child: Text("Track your order",style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700,fontSize:16,color: Colors.white ),),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  RadioValue _selectedValue = RadioValue.option1;

  void _handleRadioValueChanged(RadioValue? value) {
    setState(() {
      _selectedValue = value!;
    });
  }
  @override
  Widget build(BuildContext context) {
    // Default radio button selection


    return Scaffold(
      backgroundColor: Colors.white,
      appBar:    CommonAppBar(
        title: "Payment Method",
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
              child: Column(
                children: [
                  Text("₹120",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize:20 ),),
                  Text("Total",style: GoogleFonts.poppins(fontSize:18 ),)
                ],
              ),

            ),
            label: '',
          ),
          BottomNavigationBarItem(

            icon:
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderSummary()));
                },
                child: InkWell(
                  onTap: (){
                    changeImage();
                    _showDialog();


                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width*.42,
                      height: MediaQuery.of(context).size.width*.12,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.01),
                          border: Border.all(
                              color:AppColor.lightGreenColor
                          )
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.01 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Place Order",style: GoogleFonts.poppins(fontSize:25,color:AppColor.lightGreenColor,fontWeight: FontWeight.w600  ),),


                          ],
                        ),
                      )
                  ),
                ),
              ),),
            label: '',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.02),
          child: Column(
            children: [
              Center(
                  child: Image.asset(imageUrl,height:MediaQuery.of(context).size.height*.1 ,width: MediaQuery.of(context).size.height*.3,)),
              SizedBox(height:  MediaQuery.of(context).size.height*.02,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.height*.03),
                child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Select Payment Method",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600 ),),
                ),
              ),
              SizedBox(height:  MediaQuery.of(context).size.height*.02,),
              Container(
                height:  MediaQuery.of(context).size.height*.001,
                width:  MediaQuery.of(context).size.width*1,
                color: Colors.blueGrey.withOpacity(.4),
              ),
              SizedBox(height:  MediaQuery.of(context).size.height*.02,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                        Center(
                          child: RadioListTile<RadioValue>(
                            title:Row(
                              children: [
                                Text("UPI",style: GoogleFonts.plusJakartaSans(fontSize:16,fontWeight: FontWeight.w500) ),
                                SizedBox(width: MediaQuery.of(context).size.width*.54,),
                                AvatarSlider()
                              ],
                            ),
                            value: RadioValue.option1,
                            groupValue: _selectedValue,
                            onChanged: _handleRadioValueChanged,

                    ),
                        ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.04,),
                      Center(
                      child: RadioListTile<RadioValue>(
                        title: Row(
                          children: [
                            Text('Wallet/Postpaid',style:GoogleFonts.plusJakartaSans(fontSize:16,fontWeight: FontWeight.w500)),
                            SizedBox(width: MediaQuery.of(context).size.width*.29,),
                            AvatarSlider()
                          ],
                        ),
                        value: RadioValue.option2,
                        groupValue: _selectedValue,
                        onChanged: _handleRadioValueChanged,
                      ),
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.04,),
                    RadioListTile<RadioValue>(
                      title: Row(
                        children: [
                          Text("Debit/Credit/Atm card",style:GoogleFonts.plusJakartaSans(fontSize:16,fontWeight: FontWeight.w500) ),
                          SizedBox(width: MediaQuery.of(context).size.width*.15,),
                          CircleAvatar(
                              child: Image.asset(ShopAssets.debitcard)),
                        ],
                      ),
                      value: RadioValue.option3,
                      groupValue: _selectedValue,
                      onChanged: _handleRadioValueChanged,
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.04,),
                    RadioListTile<RadioValue>(
                      title: Row(
                        children: [
                          Text("Net banking",style: GoogleFonts.plusJakartaSans(fontSize:16,fontWeight: FontWeight.w500) ),
                          SizedBox(width: MediaQuery.of(context).size.width*.37,),
                          CircleAvatar(child: Image.asset(ShopAssets.netbanking)),
                        ],
                      ),
                      value: RadioValue.option4,
                      groupValue: _selectedValue,
                      onChanged: _handleRadioValueChanged,
                    ),
                    SizedBox(height:  MediaQuery.of(context).size.height*.04,),
                    RadioListTile<RadioValue>(
                      title: Row(
                        children: [
                          Text("Cash On Delivery",style:GoogleFonts.plusJakartaSans(fontSize:16,fontWeight: FontWeight.w500) ),
                          SizedBox(width: MediaQuery.of(context).size.width*.27,),
                          CircleAvatar(child: Image.asset(ShopAssets.cash)),
                        ],
                      ),
                      value: RadioValue.option5,
                      groupValue: _selectedValue,
                      onChanged: _handleRadioValueChanged,
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
enum RadioValue { option1, option2, option3, option4, option5 }
class ConfirmImage extends StatefulWidget {
  @override
  _ConfirmImageState createState() => _ConfirmImageState();
}

class _ConfirmImageState extends State<ConfirmImage> {
  bool isZoomed = true;

  @override
  void initState() {
    super.initState();

    // Create a timer to toggle isZoomed every 2 seconds
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        isZoomed = !isZoomed;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return
       Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: isZoomed
              ? MediaQuery
              .of(context)
              .size
              .height * 0.13
              : MediaQuery
              .of(context)
              .size
              .height * 0.08,
          width: isZoomed
              ? MediaQuery
              .of(context)
              .size
              .width * 0.3
              : MediaQuery
              .of(context)
              .size
              .width * 0.17,
          child: Image.asset(
            ShopAssets.greencorrect, // Replace with your image path
            fit: BoxFit.fill,
          ),
        ),
      );
  }

}