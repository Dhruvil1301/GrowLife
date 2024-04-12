import 'dart:convert';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/Common/Providers/providerall.dart';
import 'package:growlife/src/feature/alluser/view/widgets/suggestedList.dart';
import 'package:growlife/src/utils/route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AllUser extends ConsumerWidget {
  static const routePath = '/alluser';

  const AllUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(allUserDataProvider);
    TextEditingController searchController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){router.pop();},icon: const Icon(EvaIcons.arrowBack),),
        title: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: const Icon(EvaIcons.search),
            fillColor: Colors.black26,
            hintStyle: GoogleFonts.poppins(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            contentPadding: const EdgeInsets.all(8),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          ref.refresh(allUserDataProvider);
        },
        child: ListView.builder(
          itemCount: userData.length + 1, // Add one for loading indicator
          itemBuilder: (context, index) {
            if (index < userData.length) {
              final userDataItem = userData[index];
              return SuggestedList(image: userDataItem.profilePic, name: userDataItem.username,id: userDataItem.id,isFollowing: userDataItem.isFollowedByMe,);
            } else {
              if (ref.read(allUserDataProvider.notifier).hasMoreData) {
                ref.read(allUserDataProvider.notifier).fetchData();
                return _buildLoadingIndicator();
              } else {
                return _buildNoMoreDataIndicator(context);
              }
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildNoMoreDataIndicator(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // After 3 seconds, navigate to the "No more data available" message
      const Center(
        child: CircularProgressIndicator(),
      );

    });

    // Return a circular indicator for 3 seconds
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: Text("No more data available."))
    );
  }

}
