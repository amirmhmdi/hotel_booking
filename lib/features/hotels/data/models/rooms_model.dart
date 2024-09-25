import 'package:hotel_booking/features/hotels/data/models/overall_model.dart';
import 'package:hotel_booking/features/hotels/data/models/prices_and_occupancy_model.dart';
import 'package:hotel_booking/features/hotels/data/models/room_group_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/rooms.dart';

class RoomsModel extends Rooms {
  RoomsModel({
    required super.overall,
    required super.pricesAndOccupancy,
    required super.roomGroups,
  });

  factory RoomsModel.fromJson(Map<String, dynamic> json) => RoomsModel(
        overall: OverallModel.fromJson(json["overall"]),
        pricesAndOccupancy: List<PricesAndOccupancyModel>.from(json["prices-and-occupancy"].map((x) => PricesAndOccupancyModel.fromJson(x))),
        roomGroups: List<RoomGroupModel>.from(json["room-groups"].map((x) => RoomGroupModel.fromJson(x))),
      );
}
