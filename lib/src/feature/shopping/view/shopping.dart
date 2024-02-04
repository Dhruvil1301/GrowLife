import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/view/widgets/commonappbar.dart';
import 'package:growlife/src/feature/shopping/view/widgets/categories.dart';
import 'package:growlife/src/feature/shopping/view/widgets/product.dart';
import 'package:growlife/src/feature/wishlist/view/wishlist.dart';
import 'package:growlife/src/feature/home/view/homescreen.dart';
import 'package:growlife/src/res/assets.dart';
class Shopping extends StatefulWidget {

  const Shopping({Key? key}) : super(key: key);
  static const routePath='/shopping';
  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        final exit = await showExitConfirmationDialog(context);
        return exit ?? false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonAppBar(
            title: "Shop",
          action: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,size: 25,)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined,size: 25,)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.035 ),
            child: Column(
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
               Category(),
                Padding(
                  padding:   EdgeInsets.symmetric( vertical:MediaQuery.of(context).size.height*.025 ),
                  child: Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Text("Product Lists",style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),)),
                ),
               Products(),



              ],
            ),
          ),
        ),
      ),
    );
  }

  Future showExitConfirmationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Exit", style: GoogleFonts.lato(),),
          content: Text("Are you sure you want to exit the app?",
            style: GoogleFonts.lato(),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(
                    false); // Return false to cancel the exit
              },
              child: Text("No", style: GoogleFonts.lato(),),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop(); // Return true to confirm the exit
              },
              child: Text("Yes", style: GoogleFonts.lato(),),
            ),
          ],
        );
      },
    );
  }
}
