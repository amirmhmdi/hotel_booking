import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/hotel_detail_and_Image_widget.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/hotel_meta_info_widget.dart';

class OverviewItemWidget extends StatelessWidget {
  final Hotel hotelObj;
  const OverviewItemWidget({
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
      child: Column(
        children: [
          HotelDetailAndImageWidget(hotelObj: hotelObj),
          const Divider(indent: 20, endIndent: 20),
          HotelMetaInfoWidget(hotelObj: hotelObj),
        ],
      ),
    );
  }
}
