import 'package:hotel_booking/features/hotels/data/models/duration_range_class_model.dart';
import 'package:hotel_booking/features/hotels/data/models/room_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/used_search_request.dart';

class UsedSearchRequestModel extends UsedSearchRequest {
  UsedSearchRequestModel({
    required super.attributes,
    required super.departureAirports,
    required super.departureDate,
    required super.durationRange,
    required super.priceRange,
    required super.returnDate,
    required super.rooms,
    required super.travelType,
    required super.destination,
    required super.sort,
    required super.destinationName,
    required super.limit,
    required super.offset,
  });

  factory UsedSearchRequestModel.fromJson(Map<String, dynamic> json) => UsedSearchRequestModel(
        attributes: json["attributes"],
        departureAirports: json["departure-airports"],
        departureDate: DateTime.parse(json["departure-date"]),
        durationRange: DurationRangeClassModel.fromJson(json["duration-range"]),
        priceRange: DurationRangeClassModel.fromJson(json["price-range"]),
        returnDate: DateTime.parse(json["return-date"]),
        rooms: List<RoomModel>.from(json["rooms"].map((x) => RoomModel.fromJson(x))),
        travelType: json["travel-type"],
        destination: json["destination"],
        sort: json["sort"],
        destinationName: json["destinationName"],
        limit: json["limit"],
        offset: json["offset"],
      );
}
