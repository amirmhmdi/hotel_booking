//with the help of the https://app.quicktype.io

import 'package:hotel_booking/features/hotels/domain/entities/filter.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:hotel_booking/features/hotels/domain/entities/meta.dart';
import 'package:hotel_booking/features/hotels/domain/entities/used_search_request.dart';

class HotelSearch {
  List<Filter> filters;
  int hotelCount;
  Meta meta;
  List<Hotel> hotels;
  UsedSearchRequest usedSearchRequest;

  HotelSearch({
    required this.filters,
    required this.hotelCount,
    required this.meta,
    required this.hotels,
    required this.usedSearchRequest,
  });
}
