



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/shopping/view/widgets/product_detail.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/utils/route.dart';
class MyProduct {
final String name;
final String image;
final String price;
final String prevPrice;
final VoidCallback? onTap;
  MyProduct(  {required this.name, required this.image, required this.price,required this.prevPrice,this.onTap});

}

class Products extends StatelessWidget {
  static const routePath='/products';

  Products({Key? key}) : super(key: key);

  final List<MyProduct> products = [
    MyProduct(price: "100", prevPrice: "150", name: "Peace Lily", image: ShopAssets.peace_lily),
    MyProduct(price: "120", prevPrice: "150", name: "Rubber Plant", image: ShopAssets.rubber_plant,onTap: (){
      router.push(ProductDetail.routePath);
    }),
    MyProduct(price: "120", prevPrice: "150", name: "Fiddle leaf", image: ShopAssets.fiddleleaf),
    MyProduct(price: "80", prevPrice: "150", name: "Succulent", image: ShopAssets.succulent),
    MyProduct(price: "130", prevPrice: "150", name: "Pothos", image: ShopAssets.pothos),
    MyProduct(price: "100", prevPrice: "150", name: "monstera", image: ShopAssets.monstera),
    MyProduct(price: "120", prevPrice: "150", name: "Fiddle leaf", image: ShopAssets.fiddleleaf),
    MyProduct(price: "80", prevPrice: "150", name: "Succulent", image: ShopAssets.succulent),
    MyProduct(price: "130", prevPrice: "150", name: "Pothos", image: ShopAssets.pothos),
    MyProduct(price: "100", prevPrice: "150", name: "monstera", image: ShopAssets.monstera),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 300,
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 12,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Stack(
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.432,
                  height:  MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.018,
                        left: MediaQuery.of(context).size.width * 0.062,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              products[index].image,
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: MediaQuery.of(context).size.height * 0.14,
                            ),
                            Text(
                              products[index].name,
                              style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height * 0.025),
                            ),
                            Row(
                              children: [
                                Text(
                                  products[index].price,
                                  style: GoogleFonts.lato(
                                    fontSize: MediaQuery.of(context).size.height * 0.024,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                                Text(
                                  products[index].prevPrice,
                                  style: GoogleFonts.lato(
                                    fontSize: MediaQuery.of(context).size.height * 0.024,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                            InkWell(
                              onTap: (){
                                products[index].onTap?.call();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: const Color(0xFF327E47),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.03 ),
                                  child: Center(
                                    child: Text(
                                      "Buy Now",
                                      style: GoogleFonts.lato(
                                        color: const Color(0xFF327E47),
                                        fontSize: MediaQuery.of(context).size.height * 0.025,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: MediaQuery.of(context).size.height * 0.019,
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.height * 0.015,
                          backgroundColor: Colors.blueGrey.withOpacity(0.2),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
