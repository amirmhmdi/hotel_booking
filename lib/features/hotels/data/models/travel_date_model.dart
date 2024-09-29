import 'package:hotel_booking/features/hotels/domain/entities/travel_date.dart';

class TravelDateModel extends TravelDate {
  TravelDateModel({
    required super.days,
    required super.departureDate,
    required super.nights,
    required super.returnDate,
  });

  factory TravelDateModel.fromDomain(TravelDate travelDate) => TravelDateModel(
        days: travelDate.days,
        departureDate: travelDate.departureDate,
        nights: travelDate.nights,
        returnDate: travelDate.returnDate,
      );

  factory TravelDateModel.fromJson(Map<String, dynamic> json) => TravelDateModel(
        days: json["days"],
        departureDate: DateTime.parse(json["departure-date"]),
        nights: json["nights"],
        returnDate: DateTime.parse(json["return-date"]),
      );

  Map<String, dynamic> toJson() => {
        "days": days,
        "departure-date": "${departureDate.year.toString().padLeft(4, '0')}-${departureDate.month.toString().padLeft(2, '0')}-${departureDate.day.toString().padLeft(2, '0')}",
        "nights": nights,
        "return-date": "${returnDate.year.toString().padLeft(4, '0')}-${returnDate.month.toString().padLeft(2, '0')}-${returnDate.day.toString().padLeft(2, '0')}",
      };
}
