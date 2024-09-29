import 'package:hotel_booking/features/hotels/data/models/hotel_model.dart';

import 'package:http/http.dart' as http;

abstract class HotelDatasourceInterface {
  Future<http.Response> fetchHotelsListApi();

  List<HotelModel> getFavariteHotelsHive();

  bool addFavariteHotelsHive(HotelModel hotelObj);

  bool removeFavariteHotelsHive(HotelModel hotelObj);

  bool checkIsFavaritedHotelsHive(HotelModel hotelObj);
}
