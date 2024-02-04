import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/shopping/view/widgets/plants.dart';
import 'package:growlife/src/feature/shopping/view/widgets/product.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/utils/route.dart';

class MyCategory {
  final String name;
  final String imagePath;
  final VoidCallback? onTap;

  MyCategory( {required this.name, required this.imagePath,this.onTap});
}

class Category extends StatelessWidget {
  final List<MyCategory> categories = [
    MyCategory(name: 'Plants', imagePath: ShopAssets.plant,onTap: (){
      router.push(Plants.routePath);
    }),
    MyCategory(name: 'Accessories', imagePath: ShopAssets.accessories),
    MyCategory(name: 'Fertilizers', imagePath: ShopAssets.fertilizers),
    MyCategory(name: 'Planters', imagePath: ShopAssets.planters),
    // Add more categories as needed
  ];
  final int columns = 2;

   Category({Key? key}) : super(key: key); // Number of columns in the grid

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.025,
            left: MediaQuery.of(context).size.height * 0.025,
            right: MediaQuery.of(context).size.height * 0.025,
          ),
          child: Container(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "Categories",
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            if (index == categories.length - 1 && categories.length.isOdd) {
              // Center the last category in a separate row
              return Center(
                child: InkWell(
                  onTap: () {
                    // Handle category tap
                  },
                  child: Image.asset(
                    categories[index].imagePath,
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
              );
            } else {
              // Categories in regular rows
              return InkWell(
                onTap: () {
                  categories[index].onTap?.call();
                },
                child: Image.asset(
                  categories[index].imagePath,
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.height * 0.2,
                ),
              );
            }
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.025),
      ],
    );
  }
}