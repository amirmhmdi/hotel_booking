import 'package:hotel_booking/features/hotels/data/models/duration_range_class_model.dart';
import 'package:hotel_booking/features/hotels/data/models/room_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/used_search_request.dart';

class UsedSearchRequestModel extends UsedSearchRequest {
  final DurationRangeClassModel durationRangeModel;
  final DurationRangeClassModel priceRangeModel;
  final List<RoomModel> roomsModel;
  UsedSearchRequestModel({
    required super.attributes,
    required super.departureAirports,
    required super.departureDate,
    required this.durationRangeModel,
    required this.priceRangeModel,
    required super.returnDate,
    required this.roomsModel,
    required super.travelType,
    required super.destination,
    required super.sort,
    required super.destinationName,
    required super.limit,
    required super.offset,
  }) : super(
          durationRange: durationRangeModel,
          priceRange: priceRangeModel,
          rooms: roomsModel,
        );

  factory UsedSearchRequestModel.fromDomain(UsedSearchRequest usedSearchRequest) => UsedSearchRequestModel(
        attributes: usedSearchRequest.attributes,
        departureAirports: usedSearchRequest.departureAirports,
        departureDate: usedSearchRequest.departureDate,
        durationRangeModel: DurationRangeClassModel.fromDomain(usedSearchRequest.durationRange),
        priceRangeModel: DurationRangeClassModel.fromDomain(usedSearchRequest.priceRange),
        returnDate: usedSearchRequest.returnDate,
        roomsModel: List<RoomModel>.from(usedSearchRequest.rooms.map((x) => RoomModel.fromDomain(x))),
        travelType: usedSearchRequest.travelType,
        destination: usedSearchRequest.destination,
        sort: usedSearchRequest.sort,
        destinationName: usedSearchRequest.destinationName,
        limit: usedSearchRequest.limit,
        offset: usedSearchRequest.offset,
      );

  factory UsedSearchRequestModel.fromJson(Map<String, dynamic> json) => UsedSearchRequestModel(
        attributes: json["attributes"],
        departureAirports: json["departure-airports"],
        departureDate: DateTime.parse(json["departure-date"]),
        durationRangeModel: DurationRangeClassModel.fromJson(json["duration-range"]),
        priceRangeModel: DurationRangeClassModel.fromJson(json["price-range"]),
        returnDate: DateTime.parse(json["return-date"]),
        roomsModel: List<RoomModel>.from(json["rooms"].map((x) => RoomModel.fromJson(x))),
        travelType: json["travel-type"],
        destination: json["destination"],
        sort: json["sort"],
        destinationName: json["destinationName"],
        limit: json["limit"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes,
        "departure-airports": departureAirports,
        "departure-date": "${departureDate.year.toString().padLeft(4, '0')}-${departureDate.month.toString().padLeft(2, '0')}-${departureDate.day.toString().padLeft(2, '0')}",
        "duration-range": durationRangeModel.toJson(),
        "price-range": priceRangeModel.toJson(),
        "return-date": "${returnDate.year.toString().padLeft(4, '0')}-${returnDate.month.toString().padLeft(2, '0')}-${returnDate.day.toString().padLeft(2, '0')}",
        "rooms": List<dynamic>.from(roomsModel.map((x) => x.toJson())),
        "travel-type": travelType,
        "destination": destination,
        "sort": sort,
        "destinationName": destinationName,
        "limit": limit,
        "offset": offset,
      };
}
