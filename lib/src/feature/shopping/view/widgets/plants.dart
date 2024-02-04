import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/shopping/view/widgets/product.dart';
import 'package:growlife/src/feature/shopping/view/widgets/product_detail.dart';
import 'package:growlife/src/feature/shopping/view/shopping.dart';
import 'package:growlife/src/feature/wishlist/view/wishlist.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:provider/provider.dart';
class Plants extends StatefulWidget {

  const Plants({Key? key}) : super(key: key);
  static const routePath="/plants";
  @override
  State<Plants> createState() => _PlantsState();
}

class _PlantsState extends State<Plants> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:  CommonAppBar(
        title: "Plants",
        action: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,size: 25,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined,size: 25,)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.04),
        child: ListView(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.025,),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Search Product",
                    hintStyle: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.height*.023 ),
                    prefixIcon: Icon(Icons.search,size:MediaQuery.of(context).size.height*.035 ,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.all(MediaQuery.of(context).size.height*.01)

                ),
              ),
            ),
            Products(),

          ],
        ),
      )
    );
  }
}
