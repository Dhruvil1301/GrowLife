import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/feature/alluser/controller/follow_user_controller.dart';

class SuggestedList extends StatefulWidget {
  final String image;
  final String name;
  final String id;

  const SuggestedList({Key? key, required this.image, required this.name, required this.id}) : super(key: key);

  @override
  _SuggestedListState createState() => _SuggestedListState();
}

class _SuggestedListState extends State<SuggestedList> {
  late bool _isFollowing;

  @override
  void initState() {
    super.initState();
    _isFollowing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        // Watch the follow controller provider to access the state and methods
        final followController = ref.read(followControllerProvider);
        final unfollowController=ref.read(unfollowControllerProvider);

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
                _isFollowing?unfollowController.unfollowUser(widget.id):followController.followUser(widget.id);
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
      },
    );
  }
}
