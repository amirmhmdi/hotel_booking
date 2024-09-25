//with the help of the https://app.quicktype.io

import 'package:hotel_booking/features/hotels/data/models/filter_model.dart';
import 'package:hotel_booking/features/hotels/data/models/hotel_model.dart';
import 'package:hotel_booking/features/hotels/data/models/meta_model.dart';
import 'package:hotel_booking/features/hotels/data/models/used_search_request_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotels_search.dart';

class HotelSearchModel extends HotelSearch {
  HotelSearchModel({
    required super.filters,
    required super.hotelCount,
    required super.meta,
    required super.hotels,
    required super.usedSearchRequest,
  });

  factory HotelSearchModel.fromJson(Map<String, dynamic> json) => HotelSearchModel(
        filters: List<FilterModel>.from(json["filters"].map((x) => FilterModel.fromJson(x))),
        hotelCount: json["hotel-count"],
        meta: MetaModel.fromJson(json["meta"]),
        hotels: List<HotelModel>.from(json["hotels"].map((x) => HotelModel.fromJson(x))),
        usedSearchRequest: UsedSearchRequestModel.fromJson(json["used-search-request"]),
      );
}
