import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/order/view/widgets/orderlist.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/res/assets.dart';
class MyOrder extends StatefulWidget {


  const MyOrder({Key? key}) : super(key: key);
  static const routePath="/myorder";
  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(title: "My Order"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.01,horizontal: MediaQuery.of(context).size.height*.025 ),
              child: Column(
                children: [
                     SizedBox(height:MediaQuery.of(context).size.height*.025 ,),
                     TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search Product",
                        hintStyle: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023 ),
                        prefixIcon: Icon(Icons.search,size:MediaQuery.of(context).size.height*.035 ,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
                ],
              ),
            ),
            const OrderList(name: "Fiddle leaf fig", image: ShopAssets.fiddleleaf, delDate: "Jun 29,2023", num:"20060230"),
            const OrderList(name: "Garden Gloves", image: ShopAssets.garden_gloves, delDate: "Jun 29,2023", num:"20060230"),
            const OrderList(name: "Fiddle leaf fig", image: ShopAssets.fiddleleaf, delDate: "Jun 29,2023", num:"20060230"),
            SizedBox(height: MediaQuery.of(context).size.height*.03 ,),
            Container(
              height:MediaQuery.of(context).size.height*.03 ,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.black12,
              child: Center(child: Text("No More Order",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.017,color: Colors.black26 ),)),
            ),

          ],
        ),
      ),
    );
  }
}
