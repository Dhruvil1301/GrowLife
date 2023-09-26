import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/shop/ordersummary.dart';
import 'package:growlife/src/feature/homeview/Navigationobjects/shop/tracking.dart';
class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

  String imageUrl = "assets/shop/payment.png";
  List<String> imageUrls = ["assets/shop/payment.png","assets/shop/paymentsuccess.png"];
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
          title: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                  child: InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                    child: Image.asset("assets/shop/cross.png",height:MediaQuery.of(context).size.height*.028,width: MediaQuery.of(context).size.width*.028,))),
              Image.asset("assets/shop/greencorrect.png",height:MediaQuery.of(context).size.height*.1,width: MediaQuery.of(context).size.width*.17,),
              Text("Order Confirmed",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.028,wordSpacing: 2 ),),
              SizedBox(height:MediaQuery.of(context).size.height*.012 ,),
              Text("Order no: 1000205",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.021,wordSpacing: 1 ),),
              SizedBox(height:MediaQuery.of(context).size.height*.01 ,),
              Text('Your order has been confirmed',style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.021 ),),
              Text('will be delivered soon',style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.021 ),),

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
                      color: Color(0xFF327E47),
                    ),
                    child: Center(
                      child: Text("Track your order",style: GoogleFonts.lato(color: Colors.white,fontSize: MediaQuery.of(context).size.height*.021),),
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
      appBar:   AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderSummary()));
                },
                child: Icon(Icons.arrow_back,color: Colors.black,size:  MediaQuery.of(context).size.height*.035,)),
            SizedBox(width:  MediaQuery.of(context).size.height*.030,),
            Text("Payment Method",style: GoogleFonts.lato(color: Colors.black,fontSize:  MediaQuery.of(context).size.height*.027,fontWeight: FontWeight.bold),),
           ],
        ),
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
                  Text("₹120",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*.024 ),),
                  Text("Total",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.024 ),)

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
                              color:  Color(0xFF268E15)
                          )
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*.01 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Place Order",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.025,color:Color(0xFF268E15),fontWeight: FontWeight.bold  ),),


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
                  child: Text("Select Payment Method",style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*.023,fontWeight: FontWeight.bold ),),
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
                                Text("UPI",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022) ),
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
                            Text('Wallet/Postpaid',style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022 ),),
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
                          Text("Debit/Credit/Atm card",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022) ),
                          SizedBox(width: MediaQuery.of(context).size.width*.15,),
                          CircleAvatar(
                              child: Image.asset("assets/shop/debitcard.png")),
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
                          Text("Net banking",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022) ),
                          SizedBox(width: MediaQuery.of(context).size.width*.37,),
                          CircleAvatar(child: Image.asset("assets/shop/netbanking.png")),
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
                          Text("Cash On Delivery",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.022) ),
                          SizedBox(width: MediaQuery.of(context).size.width*.27,),
                          CircleAvatar(child: Image.asset("assets/shop/cash.png")),
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


class AvatarSlider extends StatefulWidget {
  @override
  _AvatarSliderState createState() => _AvatarSliderState();
}

class _AvatarSliderState extends State<AvatarSlider> {
  int _currentIndex = 0;
  late final ValueNotifier<int> _notifier;

  List<String> assetPaths = [
    'assets/shop/phonepay.png',                               //ITS IS FOR PAYMENT METHOD  PAGE
    'assets/shop/paytm.png',
    'assets/shop/googlepay.png',
    // Add more asset paths as needed
  ];

  @override
  void initState() {
    super.initState();
    _notifier = ValueNotifier<int>(_currentIndex);
    _startAutoSlide();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        _currentIndex = (_currentIndex + 1) % assetPaths.length;
        _notifier.value = _currentIndex;
        _startAutoSlide();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder<int>(
          valueListenable: _notifier,
          builder: (context, index, _) {
            return CircleAvatar(
              radius:  MediaQuery.of(context).size.height*.025,
              backgroundColor: Colors.white,
              child: Image(
                image: AssetImage(assetPaths[index]),
                fit: BoxFit.contain, // Choose an appropriate fit option
              ),

            );
          },

    );
  }
}

