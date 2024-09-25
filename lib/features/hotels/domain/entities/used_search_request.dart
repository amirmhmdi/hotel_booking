import 'package:hotel_booking/features/hotels/domain/entities/duration_range_class.dart';
import 'package:hotel_booking/features/hotels/domain/entities/room.dart';

class UsedSearchRequest {
  String attributes;
  String departureAirports;
  DateTime departureDate;
  DurationRangeClass durationRange;
  DurationRangeClass priceRange;
  DateTime returnDate;
  List<Room> rooms;
  String travelType;
  String destination;
  String sort;
  dynamic destinationName;
  int limit;
  int offset;

  UsedSearchRequest({
    required this.attributes,
    required this.departureAirports,
    required this.departureDate,
    required this.durationRange,
    required this.priceRange,
    required this.returnDate,
    required this.rooms,
    required this.travelType,
    required this.destination,
    required this.sort,
    required this.destinationName,
    required this.limit,
    required this.offset,
  });
}
