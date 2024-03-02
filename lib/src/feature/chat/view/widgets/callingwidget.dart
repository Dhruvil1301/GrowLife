import 'package:flutter/material.dart';
import 'package:growlife/src/feature/chat/view/widgets/callinglist.dart';
import 'package:growlife/src/res/assets.dart';

class CallWidget extends StatelessWidget {
  const CallWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children:  const [
            CallingList(image: ImageAssets.circularimg2, name: "John Doe", status: "Received", time: "Yesterday,22:10"),
            CallingList(image: ImageAssets.circularimg2, name: "John Doe", status: "Answered", time: "Yesterday,22:10"),
            CallingList(image: ImageAssets.circularimg2, name: "John Doe", status: "Missed", time: "Yesterday,22:10"),
            CallingList(image: ImageAssets.circularimg2, name: "John Doe", status: "Missed", time: "Yesterday,22:10"),
            CallingList(image: ImageAssets.circularimg2, name: "John Doe", status: "Received", time: "Yesterday,22:10"),
            CallingList(image: ImageAssets.circularimg2, name: "John Doe", status: "Received", time: "Yesterday,22:10"),
            CallingList(image: ImageAssets.circularimg2, name: "John Doe", status: "Missed", time: "Yesterday,22:10"),
          ],
        ),
      ),
    );
  }
}
