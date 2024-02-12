import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/chat/view/widgets/chatlist.dart';
import 'package:growlife/src/feature/chat/view/widgets/chatscreen.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/utils/route.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView(
        children:  [
           ChatList(image: ImageAssets.circularimg1, name:"John Deo", lastMsg: "Hello", lastMsgTime: "18:31", No_of_unreadMsg: "5", unreadMsg: true,onTap: (){
             router.push(ChatScreen.routePath);
           },),
          ChatList(image: ImageAssets.circularimg1, name:"John Deo", lastMsg: "How are you?", lastMsgTime: "16:04", No_of_unreadMsg: "5", unreadMsg: false),
          ChatList(image: ImageAssets.circularimg1, name:"John Deo", lastMsg: "Hello", lastMsgTime: "06:12", No_of_unreadMsg: "5", unreadMsg: false),
          ChatList(image: ImageAssets.circularimg1, name:"John Deo", lastMsg: "Hello", lastMsgTime: "Yesterday", No_of_unreadMsg: "5", unreadMsg: false),
          ChatList(image: ImageAssets.circularimg1, name:"John Deo", lastMsg: "Hello", lastMsgTime: "Yesterday", No_of_unreadMsg: "5", unreadMsg: false),
          ChatList(image: ImageAssets.circularimg1, name:"John Deo", lastMsg: "Hello", lastMsgTime: "Jan 23", No_of_unreadMsg: "5", unreadMsg: true),
          ChatList(image: ImageAssets.circularimg1, name:"John Deo", lastMsg: "Hello", lastMsgTime: "Jan 12", No_of_unreadMsg: "5", unreadMsg: false)
        ],
      ),
    );
  }
}
