import 'package:hotel_booking/features/hotels/data/models/rooms_model.dart';
import 'package:hotel_booking/features/hotels/data/models/travel_date_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/best_offer.dart';

class BestOfferModel extends BestOffer {
  final RoomsModel roomsModel;
  final TravelDateModel travelDateModel;
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
    required this.roomsModel,
    required this.travelDateModel,
  }) : super(
          rooms: roomsModel,
          travelDate: travelDateModel,
        );

  factory BestOfferModel.fromDomain(BestOffer bestOffer) => BestOfferModel(
        appliedTravelDiscount: bestOffer.appliedTravelDiscount,
        detailedPricePerPerson: bestOffer.detailedPricePerPerson,
        includedTravelDiscount: bestOffer.includedTravelDiscount,
        originalTravelPrice: bestOffer.originalTravelPrice,
        simplePricePerPerson: bestOffer.simplePricePerPerson,
        total: bestOffer.total,
        travelPrice: bestOffer.travelPrice,
        availableSpecialGroups: bestOffer.availableSpecialGroups,
        flightIncluded: bestOffer.flightIncluded,
        roomsModel: RoomsModel.fromDomain(bestOffer.rooms),
        travelDateModel: TravelDateModel.fromDomain(bestOffer.travelDate),
      );

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
        roomsModel: RoomsModel.fromJson(json["rooms"]),
        travelDateModel: TravelDateModel.fromJson(json["travel-date"]),
      );

  Map<String, dynamic> toJson() => {
        "applied-travel-discount": appliedTravelDiscount,
        "detailed-price-per-person": List<dynamic>.from(detailedPricePerPerson.map((x) => x)),
        "included-travel-discount": includedTravelDiscount,
        "original-travel-price": originalTravelPrice,
        "simple-price-per-person": simplePricePerPerson,
        "total": total,
        "travel-price": travelPrice,
        "available-special-groups": List<dynamic>.from(availableSpecialGroups.map((x) => availableSpecialGroupValues.reverse[x])),
        "flight-included": flightIncluded,
        "rooms": roomsModel.toJson(),
        "travel-date": travelDateModel.toJson(),
      };
}
