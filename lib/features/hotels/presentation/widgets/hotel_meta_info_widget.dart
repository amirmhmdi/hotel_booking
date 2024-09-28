import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:intl/intl.dart';

class HotelMetaInfoWidget extends StatelessWidget {
  final Hotel hotelObj;
  const HotelMetaInfoWidget({super.key, required this.hotelObj});

  final TextStyle _textStyleInfo = const TextStyle(fontSize: 14, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          "${hotelObj.bestOffer.travelDate.days} Tage",
                          style: _textStyleInfo,
                        ),
                        const SizedBox(height: 18, child: VerticalDivider()),
                        Text(
                          "${hotelObj.bestOffer.travelDate.nights} Nachte",
                          style: _textStyleInfo,
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Text(
                          hotelObj.bestOffer.rooms.overall.name,
                          style: _textStyleInfo,
                        ),
                        const SizedBox(height: 18, child: VerticalDivider()),
                        Text(
                          hotelObj.bestOffer.rooms.overall.boarding,
                          style: _textStyleInfo,
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Text(
                          "${hotelObj.bestOffer.rooms.overall.adultCount.toString()} Erw., ${hotelObj.bestOffer.rooms.overall.childrenCount.toString()} Kinder",
                          style: _textStyleInfo,
                        ),
                        const SizedBox(height: 18, child: VerticalDivider()),
                        Text(
                          (hotelObj.bestOffer.flightIncluded == true) ? "inkl. Flug" : "not inkl. Flug",
                          style: _textStyleInfo,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(text: "ab ", style: TextStyle(fontSize: 14, color: Colors.grey)),
                          TextSpan(
                              text: NumberFormat.currency(locale: "es_EA", symbol: "€").format(hotelObj.bestOffer.total),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))
                        ],
                      ),
                    ),
                    Text(
                      "${NumberFormat.currency(locale: "es_EA", symbol: "€").format(hotelObj.bestOffer.simplePricePerPerson)} p.P.",
                      style: _textStyleInfo,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.orange.shade400,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
              ),
              child: const Text(
                "Zu den Angeboten",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
