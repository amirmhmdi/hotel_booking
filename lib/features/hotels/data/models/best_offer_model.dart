import 'package:hotel_booking/features/hotels/data/models/rooms_model.dart';
import 'package:hotel_booking/features/hotels/data/models/travel_date_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/best_offer.dart';

class BestOfferModel extends BestOffer {
  BestOfferModel({
    required super.appliedTravelDiscount,
    required super.detailedPricePerPerson,
    required super.includedTravelDiscount,
    required super.originalTravelPrice,
    required super.simplePricePerPerson,
    required super.total,
    required super.travelPrice,
    required super.availableSpecialGroups,
    required super.flightIncluded,
    required super.rooms,
    required super.travelDate,
  });

  factory BestOfferModel.fromJson(Map<String, dynamic> json) => BestOfferModel(
        appliedTravelDiscount: json["applied-travel-discount"],
        detailedPricePerPerson: List<dynamic>.from(json["detailed-price-per-person"].map((x) => x)),
        includedTravelDiscount: json["included-travel-discount"],
        originalTravelPrice: json["original-travel-price"],
        simplePricePerPerson: json["simple-price-per-person"],
        total: json["total"],
        travelPrice: json["travel-price"],
        availableSpecialGroups: List<AvailableSpecialGroup>.from(json["available-special-groups"].map((x) => availableSpecialGroupValues.map[x]!)),
        flightIncluded: json["flight-included"],
        rooms: RoomsModel.fromJson(json["rooms"]),
        travelDate: TravelDateModel.fromJson(json["travel-date"]),
      );
}
