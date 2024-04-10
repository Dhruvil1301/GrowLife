import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/res/color.dart';

class SuggestedList extends StatefulWidget {
  final String image;
  final String name;
  const SuggestedList({Key? key, required this.image, required this.name}) : super(key: key);

  @override
  _SuggestedListState createState() => _SuggestedListState();
}

class _SuggestedListState extends State<SuggestedList> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.023),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(widget.image),
        ),
        title: Text(
          widget.name,
          style: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        trailing: InkWell(
          onTap: () {
            setState(() {
              _isFollowing = !_isFollowing;
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              color: _isFollowing ? AppColor.barColor : AppColor.blueButtonColor,
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.01),
            ),
            child: Center(
              child: Text(
                _isFollowing ? "Following" : "Follow",
                style: GoogleFonts.plusJakartaSans(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
