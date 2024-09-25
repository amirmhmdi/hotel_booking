import 'package:hotel_booking/features/hotels/domain/entities/overall.dart';
import 'package:hotel_booking/features/hotels/domain/entities/prices_and_occupancy.dart';
import 'package:hotel_booking/features/hotels/domain/entities/room_group.dart';

class Rooms {
  Overall overall;
  List<PricesAndOccupancy> pricesAndOccupancy;
  List<RoomGroup> roomGroups;

  Rooms({
    required this.overall,
    required this.pricesAndOccupancy,
    required this.roomGroups,
  });
}
