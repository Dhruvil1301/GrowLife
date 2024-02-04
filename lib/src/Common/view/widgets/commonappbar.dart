import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/utils/route.dart';
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? action;
  final Widget? bottom;

  CommonAppBar({
    required this.title,
    this.leading,
    this.action, this.bottom,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: GoogleFonts.plusJakartaSans(fontSize: 18,fontWeight: FontWeight.w600),),
      leading: IconButton(onPressed: (){
        router.pop();
      }, icon:Icon(Icons.arrow_back,size: 25,)),
      actions: action ?? [],
      bottom:  bottom != null ? PreferredSize(child: bottom!, preferredSize: Size.zero) : null,
    );
  }
}