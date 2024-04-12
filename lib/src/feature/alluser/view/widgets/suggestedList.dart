import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/res/color.dart';
import 'package:growlife/src/feature/alluser/controller/follow_user_controller.dart';

class SuggestedList extends ConsumerWidget {
  final String image;
  final String name;
  final String id;
  final bool isFollowing;

  const SuggestedList({
    Key? key,
    required this.image,
    required this.name,
    required this.id,
    required this.isFollowing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followController = ref.read(followControllerProvider);
    final unfollowController = ref.read(unfollowControllerProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.023),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(image),
        ),
        title: Text(
          name,
          style: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        trailing: InkWell(
          onTap: () async {
            try {
              if (isFollowing) {
                await unfollowController.unfollowUser(id);
              } else {
                await followController.followUser(id);
              }
              // Refresh the user data after follow/unfollow action
              ref.refresh(allUserDataProvider);
            } catch (error) {
              print('Error: $error');
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              color: isFollowing ? AppColor.barColor : AppColor.blueButtonColor,
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.01),
            ),
            child: Center(
              child: Text(
                isFollowing ? "Following" : "Follow",
                style: GoogleFonts.plusJakartaSans(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
