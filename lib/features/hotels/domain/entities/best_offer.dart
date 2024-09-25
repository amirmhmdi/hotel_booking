import 'package:hotel_booking/features/hotels/domain/entities/enum_values.dart';
import 'package:hotel_booking/features/hotels/domain/entities/rooms.dart';
import 'package:hotel_booking/features/hotels/domain/entities/travel_date.dart';

class BestOffer {
  dynamic appliedTravelDiscount;
  List<dynamic> detailedPricePerPerson;
  int includedTravelDiscount;
  int originalTravelPrice;
  int simplePricePerPerson;
  int total;
  int travelPrice;
  List<AvailableSpecialGroup> availableSpecialGroups;
  bool flightIncluded;
  Rooms rooms;
  TravelDate travelDate;

  BestOffer({
    required this.appliedTravelDiscount,
    required this.detailedPricePerPerson,
    required this.includedTravelDiscount,
    required this.originalTravelPrice,
    required this.simplePricePerPerson,
    required this.total,
    required this.travelPrice,
    required this.availableSpecialGroups,
    required this.flightIncluded,
    required this.rooms,
    required this.travelDate,
  });
}

enum AvailableSpecialGroup { FLEXIBLE, PROMOTION }

final availableSpecialGroupValues = EnumValues({"flexible": AvailableSpecialGroup.FLEXIBLE, "promotion": AvailableSpecialGroup.PROMOTION});
