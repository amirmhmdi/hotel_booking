import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';

class HotelImageStackWidget extends StatefulWidget {
  final Hotel hotelObj;
  const HotelImageStackWidget({super.key, required this.hotelObj});

  @override
  State<HotelImageStackWidget> createState() => _HotelImageStackWidgetState();
}

class _HotelImageStackWidgetState extends State<HotelImageStackWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          widget.hotelObj.images.first.small,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              padding: const EdgeInsets.all(8.0),
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "🙂 ${widget.hotelObj.ratingInfo.score} / 5.0",
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "${widget.hotelObj.ratingInfo.scoreDescription} (${widget.hotelObj.ratingInfo.reviewsCount} Bew.)",
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
