class PricesAndOccupancy {
  int adultCount;
  List<dynamic> childrenAges;
  int childrenCount;
  List<dynamic> detailedPricePerPerson;
  String groupIdentifier;
  int simplePricePerPerson;
  int total;

  PricesAndOccupancy({
    required this.adultCount,
    required this.childrenAges,
    required this.childrenCount,
    required this.detailedPricePerPerson,
    required this.groupIdentifier,
    required this.simplePricePerPerson,
    required this.total,
  });
}
