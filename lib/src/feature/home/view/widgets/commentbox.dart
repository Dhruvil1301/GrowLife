import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growlife/src/feature/home/controller/addcomment_controller.dart';
import 'package:growlife/src/utils/route.dart';
class Commentbox extends ConsumerStatefulWidget {
  final String videoId;
  final  String totalComments;
  const Commentbox(  {Key? key,required this.videoId,required this.totalComments,}) : super(key: key);


  @override
  ConsumerState<Commentbox> createState() => _CommentboxState();
}

class _CommentboxState extends ConsumerState<Commentbox> {
  TextEditingController commentController=TextEditingController();
  List<Map<String, String>> comments = [
    {
      'author': 'KaDhare Finley',
      'time': '7mo ago',
      'comment': 'The Struggle was real when he was trying to hit the timer',
      'replies': '10',
    },
    // Add more comments here if needed
  ];
@override
Widget build(BuildContext context) {
  final commentProvider=ref.read(commentControllerProvider);
  return Container(
    height: MediaQuery.of(context).size.height * 0.5,
    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.01,left:MediaQuery.of(context).size.width* 0.03, right:MediaQuery.of(context).size.width* 0.03, ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: Container(
            height: MediaQuery.of(context).size.height*.005,
            width: MediaQuery.of(context).size.width*.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.13,),
                color: Colors.grey.withOpacity(.5)
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Comments',
                    style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.05,color: Colors.black,fontWeight: FontWeight.bold ),
                  ),
                  SizedBox(width:MediaQuery.of(context).size.width * 0.03,),
                  Text(
                    widget.totalComments,
                    style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04,color: Colors.black.withOpacity(.5), ),
                  ),
                ],
              ),
              InkWell(
                  onTap: (){
                    router.pop();
                  },
                  child: Icon(Icons.close,size:MediaQuery.of(context).size.width * 0.06,color: Colors.black.withOpacity(.5),))
            ],
          ),
        ),
        Divider(), // Add a divider below the title
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01,
              horizontal: MediaQuery.of(context).size.width * 0.02,
            ),
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return CommentList(
                  ownerName: comment['author'] ?? '',
                  uploadingTime: comment['time'] ?? '',
                  image: comment['image'] ?? '',
                  commentContent: comment['comment'] ?? '',
                  totalReplies: comment['replies'] ?? '',
                );
              },
            ),
          ),
        ),

        Padding(
          padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height * 0.01 ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextFormField(
                controller:commentController,
                decoration: InputDecoration(
                    hintText: 'Type your comment here',
                    hintStyle: GoogleFonts.lato(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height * 0.01,horizontal: MediaQuery.of(context).size.width* 0.04 )
                ),

              ),
              Positioned(
                  right:  MediaQuery.of(context).size.width * 0.02,
                  child: InkWell(
                    onTap: (){
                      commentProvider.addComment(widget.videoId, commentController.text);
                    },
                      child: Icon(Icons.send,color: Color(0xFF1F588E),size: MediaQuery.of(context).size.width * 0.08 ,)))
            ],
          ),
        ),
        SizedBox(height: 16.0),

      ],
    ),
  );
}
}
class CommentList extends StatelessWidget {
  final String ownerName;
  final String uploadingTime;
  final String image;
  final String commentContent;
  final String totalReplies;
  const CommentList({Key? key, required this.ownerName, required this.uploadingTime, required this.image, required this.commentContent, required this.totalReplies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueGrey.withOpacity(.5),
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(width:MediaQuery.of(context).size.width * 0.03,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${ownerName}"+ " ·" +" ${uploadingTime}",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.035,color: Colors.grey),),
                SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                Container(
                    width:MediaQuery.of(context).size.width * 0.7,
                    child: Text(commentContent,style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04),)),
                SizedBox(height:MediaQuery.of(context).size.height * 0.01,),
                Container(
                    child: Text( totalReplies+" replies",style: GoogleFonts.lato(fontSize:MediaQuery.of(context).size.width * 0.04,color: Colors.blueAccent),)),

              ],
            ),
            SizedBox(width:MediaQuery.of(context).size.width * 0.01,),
            Icon(Icons.more_vert_sharp,size:MediaQuery.of(context).size.width * 0.05 ,color: Colors.grey.withOpacity(.8),)
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height*.02,),
      ],
    );
  }
}
