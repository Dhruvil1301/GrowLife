import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/chat/view/widgets/calling.dart';
import 'package:growlife/src/res/assets.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/utils/route.dart';
import 'package:intl/intl.dart';

class Message {
  final String text;
  final bool isMe;
  final DateTime time;

  Message({required this.text, required this.isMe, required this.time});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static const routePath = "/chatscreen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController(); // Define ScrollController

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the ScrollController
    super.dispose();
  }

  void _sendMessage() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _messages.add(Message(
          text: _textController.text,
          isMe: true,
          time: DateTime.now(),
        ));
        // Simulate receiving a dummy message after sending a message
        _messages.add(Message(
          text: "This is a dummy message from the other side",
          isMe: false,
          time: DateTime.now().add(const Duration(minutes: 1)),
        ));
        _textController.clear();
      });
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    }
  }

  Widget _buildMessage(Message message) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: message.isMe
          ? EdgeInsets.only(
          left: w * .12, top: h * .01, bottom: h * .01, right: w * .03)
          : EdgeInsets.only(
          left: w * .03, top: h * .01, bottom: h * .01, right: w * .12),
      child: Align(
        alignment: message.isMe ? Alignment.bottomRight : Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: message.isMe ? AppColor.greenColor : AppColor.msgContainerColor,
              borderRadius: message.isMe
                  ? const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )
                  : const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                message.text,
                style: GoogleFonts.poppins(color: message.isMe ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 4),
              Text(
                DateFormat.Hm().format(message.time),
                style: GoogleFonts.poppins(fontSize: 12, color: message.isMe ? Colors.white70 : Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              CircleAvatar(
                radius: 25,
                child: Image.asset(ImageAssets.circularimg1),
              ),
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: Text('John Deo',style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w500),),
               ),
            ],
          ),
          leading: IconButton(onPressed: (){
            router.pop();
          },icon: const Icon(Icons.arrow_back,size: 25,),),
          actions: [
            IconButton(onPressed: (){
              router.push(UserCalling.routePath);
            }, icon: const Icon(Icons.phone,size: 25,))
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    onPressed: () {
                      // Implement your logic for emoji selection
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      style: GoogleFonts.lato(),
                      decoration:  InputDecoration(
                        hintText: 'Write a message',
                        hintStyle: GoogleFonts.lato(),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.attach_file),
                    onPressed: () {
                      // Implement your logic for file sharing
                    },
                  ),
                  const SizedBox(width: 8),
                  _textController.text.isNotEmpty
                      ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                         decoration: const BoxDecoration(
                           shape: BoxShape.circle,
                           color: AppColor.greenColor
                         ),
                          child: IconButton(
                    icon: const Icon(Icons.send,color: Colors.white,size: 25,),
                    onPressed: _sendMessage,
                  ),
                        ),
                      )
                      : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                         decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.greenColor
                    ),
                          child: IconButton(
                    icon: const Icon(Icons.mic,color: Colors.white,),
                    onPressed: () {
                          // Implement your logic for voice input
                    },
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
  }
}
