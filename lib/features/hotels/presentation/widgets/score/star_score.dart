import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/score/star.dart';

class StarScore extends StatelessWidget {
  final Star star;
  final double score;
  final Widget tail;

  StarScore({this.star = const Star(), required this.score, required this.tail});

  @override
  Widget build(BuildContext context) {
    var li = <StarWidget>[];
    int count = score.floor();
    for (int i = 0; i < count; i++) {
      li.add(StarWidget(star: star.copyWith(progress: 1.0)));
    }
    if (score - count > 0) {
      li.add(StarWidget(star: star.copyWith(progress: score - count)));
    }
    //ADDED BY @AMIR MOHAMMADI
    while (li.length < 5) {
      li.add(StarWidget(star: star.copyWith(progress: 0.0)));
    }
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ...li,
        SizedBox(
          width: 10,
        ),
        if (tail != null) tail
      ],
    );
  }
}
