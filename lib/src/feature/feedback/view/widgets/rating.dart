import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _star = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _star = index + 1;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              index < _star ? Icons.star : Icons.star_border,
              color: index < _star
                  ? const Color.fromRGBO(255, 215, 0, 1.0)
                  : Colors.black38,
              size: 36.0,
            ),
          ),
        );
      }),
    );
  }
}