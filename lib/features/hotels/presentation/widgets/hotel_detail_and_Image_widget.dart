import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/hotel_image_stack_widget.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/score/star.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/score/star_score.dart';

class HotelDetailAndImageWidget extends StatelessWidget {
  final Hotel hotelObj;
  const HotelDetailAndImageWidget({super.key, required this.hotelObj});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelImageStackWidget(hotelObj: hotelObj),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StarScore(
                score: hotelObj.category.toDouble(),
                star: const Star(
                  size: 14,
                  fillColor: Colors.black,
                  num: 5,
                ),
                tail: const Icon(Icons.info_outline, size: 16),
              ),
              Text(
                hotelObj.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                hotelObj.destination,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
