import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StarRating extends StatelessWidget {
  final int rating;
  StarRating(this.rating);

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(
      stars,
      style: TextStyle(fontSize: 18.0),
    );
  }
}
