import 'package:hotel_booking/features/hotels/domain/entities/prices_and_occupancy.dart';

class PricesAndOccupancyModel extends PricesAndOccupancy {
  PricesAndOccupancyModel({
    required super.adultCount,
    required super.childrenAges,
    required super.childrenCount,
    required super.detailedPricePerPerson,
    required super.groupIdentifier,
    required super.simplePricePerPerson,
    required super.total,
  });

  factory PricesAndOccupancyModel.fromDomain(PricesAndOccupancy pricesAndOccupancy) => PricesAndOccupancyModel(
        adultCount: pricesAndOccupancy.adultCount,
        childrenAges: pricesAndOccupancy.childrenAges,
        childrenCount: pricesAndOccupancy.childrenCount,
        detailedPricePerPerson: pricesAndOccupancy.detailedPricePerPerson,
        groupIdentifier: pricesAndOccupancy.groupIdentifier,
        simplePricePerPerson: pricesAndOccupancy.simplePricePerPerson,
        total: pricesAndOccupancy.total,
      );

  factory PricesAndOccupancyModel.fromJson(Map<String, dynamic> json) => PricesAndOccupancyModel(
        adultCount: json["adult-count"],
        childrenAges: List<dynamic>.from(json["children-ages"].map((x) => x)),
        childrenCount: json["children-count"],
        detailedPricePerPerson: List<dynamic>.from(json["detailed-price-per-person"].map((x) => x)),
        groupIdentifier: json["group-identifier"],
        simplePricePerPerson: json["simple-price-per-person"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "adult-count": adultCount,
        "children-ages": List<dynamic>.from(childrenAges.map((x) => x)),
        "children-count": childrenCount,
        "detailed-price-per-person": List<dynamic>.from(detailedPricePerPerson.map((x) => x)),
        "group-identifier": groupIdentifier,
        "simple-price-per-person": simplePricePerPerson,
        "total": total,
      };
}
