import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/hotel_detail_and_Image_widget.dart';

class FavoriteItemWidget extends StatelessWidget {
  final Hotel hotelObj;
  const FavoriteItemWidget({
    super.key,
    required this.hotelObj,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: HotelDetailAndImageWidget(hotelObj: hotelObj, showRating: true),
    );
  }
}
