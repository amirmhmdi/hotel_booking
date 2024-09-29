import 'package:hotel_booking/features/hotels/data/models/overall_model.dart';
import 'package:hotel_booking/features/hotels/data/models/prices_and_occupancy_model.dart';
import 'package:hotel_booking/features/hotels/data/models/room_group_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/rooms.dart';

class RoomsModel extends Rooms {
  final OverallModel overallModel;
  final List<PricesAndOccupancyModel> pricesAndOccupancyModel;
  final List<RoomGroupModel> roomGroupsModel;
  RoomsModel({
    required this.overallModel,
    required this.pricesAndOccupancyModel,
    required this.roomGroupsModel,
  }) : super(
          overall: overallModel,
          pricesAndOccupancy: pricesAndOccupancyModel,
          roomGroups: roomGroupsModel,
        );

  factory RoomsModel.fromDomain(Rooms rooms) => RoomsModel(
      overallModel: OverallModel.fromDomain(rooms.overall),
      pricesAndOccupancyModel: List<PricesAndOccupancyModel>.from(rooms.pricesAndOccupancy.map((x) => PricesAndOccupancyModel.fromDomain(x))),
      roomGroupsModel: List<RoomGroupModel>.from(rooms.roomGroups.map((x) => RoomGroupModel.fromDomain(x))));

  factory RoomsModel.fromJson(Map<String, dynamic> json) => RoomsModel(
        overallModel: OverallModel.fromJson(json["overall"]),
        pricesAndOccupancyModel: List<PricesAndOccupancyModel>.from(json["prices-and-occupancy"].map((x) => PricesAndOccupancyModel.fromJson(x))),
        roomGroupsModel: List<RoomGroupModel>.from(json["room-groups"].map((x) => RoomGroupModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "overall": overallModel.toJson(),
        "prices-and-occupancy": List<dynamic>.from(pricesAndOccupancyModel.map((x) => x.toJson())),
        "room-groups": List<dynamic>.from(roomGroupsModel.map((x) => x.toJson())),
      };
}
