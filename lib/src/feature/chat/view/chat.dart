import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/chat/view/widgets/chatwidget.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';

class ChatView extends StatelessWidget {

  const ChatView({Key? key}) : super(key: key);
  static var routePath="/chatview";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 25),
          child: AppBar(
            title:  Text('Chats',style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600,fontSize: 18),),
            leading: IconButton(onPressed: (){
              router.pop();
            },icon: const Icon(Icons.arrow_back,size: 25,),),
            bottom:  TabBar(
              indicatorPadding: EdgeInsets.zero,
              indicatorSize:TabBarIndicatorSize.tab ,
              indicatorColor: AppColor.greenColor,
              labelStyle: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w500),
              labelColor: AppColor.greenColor,
              indicatorWeight: 3,
              tabs: const [
                 Tab(
                  text: 'CHAT', // Optional icon
                ),
                 Tab(
                  text: 'CALLS', // Optional icon
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            // Chat tab content
            ChatWidget(),
            // Call tab content
            Center(
              child: Text('Call Tab Content'),
            ),
          ],
        ),
      ),
    );
  }
}
class MyTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MyTabIndicatorPainter();
  }
}

// Custom painter for the tab indicator
class _MyTabIndicatorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint();
    paint.color = Colors.blue; // Indicator color
    paint.style = PaintingStyle.fill;
    final double indicatorHeight = 4.0; // Adjust the height as needed
    final double indicatorWidth = rect.width / 2; // Width of each tab
    final double indicatorOffset = (rect.width / 2) - (indicatorWidth / 2); // Offset to center the indicator
    final double yPosition = 0; // Position above the text
    canvas.drawRect(
      Rect.fromLTWH(offset.dx + indicatorOffset, offset.dy - indicatorHeight - yPosition, indicatorWidth, indicatorHeight),
      paint,
    );
  }
}