//with the help of the https://app.quicktype.io

import 'package:hotel_booking/features/hotels/data/models/filter_model.dart';
import 'package:hotel_booking/features/hotels/data/models/hotel_model.dart';
import 'package:hotel_booking/features/hotels/data/models/meta_model.dart';
import 'package:hotel_booking/features/hotels/data/models/used_search_request_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotels_search.dart';

class HotelSearchModel extends HotelSearch {
  final List<FilterModel> filtersModel;
  final MetaModel metaModel;
  final List<HotelModel> hotelsModel;
  final UsedSearchRequestModel usedSearchRequestModel;
  HotelSearchModel({
    required this.filtersModel,
    required super.hotelCount,
    required this.metaModel,
    required this.hotelsModel,
    required this.usedSearchRequestModel,
  }) : super(
          filters: filtersModel,
          meta: metaModel,
          hotels: hotelsModel,
          usedSearchRequest: usedSearchRequestModel,
        );

  factory HotelSearchModel.fromDomain(HotelSearch hotelSearch) => HotelSearchModel(
        filtersModel: List<FilterModel>.from(hotelSearch.filters.map((x) => FilterModel.fromDomain(x))),
        hotelCount: hotelSearch.hotelCount,
        metaModel: MetaModel.fromDomin(hotelSearch.meta),
        hotelsModel: List<HotelModel>.from(hotelSearch.hotels.map((x) => HotelModel.fromDomain(x))),
        usedSearchRequestModel: UsedSearchRequestModel.fromDomain(hotelSearch.usedSearchRequest),
      );

  factory HotelSearchModel.fromJson(Map<String, dynamic> json) => HotelSearchModel(
        filtersModel: List<FilterModel>.from(json["filters"].map((x) => FilterModel.fromJson(x))),
        hotelCount: json["hotel-count"],
        metaModel: MetaModel.fromJson(json["meta"]),
        hotelsModel: List<HotelModel>.from(json["hotels"].map((x) => HotelModel.fromJson(x))),
        usedSearchRequestModel: UsedSearchRequestModel.fromJson(json["used-search-request"]),
      );

  Map<String, dynamic> toJson() => {
        "filters": List<dynamic>.from(filtersModel.map((x) => x.toJson())),
        "hotel-count": hotelCount,
        "meta": metaModel.toJson(),
        "hotels": List<dynamic>.from(hotelsModel.map((x) => x.toJson())),
        "used-search-request": usedSearchRequestModel.toJson(),
      };
}
