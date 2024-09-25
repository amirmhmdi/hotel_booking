import 'package:hotel_booking/features/hotels/domain/entities/travel_date.dart';

class TravelDateModel extends TravelDate {
  TravelDateModel({
    required super.days,
    required super.departureDate,
    required super.nights,
    required super.returnDate,
  });

  factory TravelDateModel.fromJson(Map<String, dynamic> json) => TravelDateModel(
        days: json["days"],
        departureDate: DateTime.parse(json["departure-date"]),
        nights: json["nights"],
        returnDate: DateTime.parse(json["return-date"]),
      );
}
