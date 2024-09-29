import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hotel_booking/features/hotels/data/datasources/hotel_datasource_interface.dart';
import 'package:hotel_booking/features/hotels/data/models/hotel_model.dart';
import 'package:http/http.dart' as http;

class HotelDatasourceImpl implements HotelDatasourceInterface {
  @override
  Future<http.Response> fetchHotelsListApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://dkndmolrswy7b.cloudfront.net/hotels.json"),
        headers: {"Content-Type": "application/json"},
      );
      return response;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  bool addFavariteHotelsHive(HotelModel hotelObj) {
    try {
      GetIt.I<Box>().put(hotelObj.hotelId, hotelObj.toJson());
      print(GetIt.I<Box>().keys);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  List<HotelModel> getFavariteHotelsHive() {
    try {
      List<HotelModel> hotelsList = [];
      for (var hotelJson in GetIt.I<Box>().values) {
        hotelsList.add(HotelModel.fromJson(hotelJson));
      }
      return hotelsList;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  bool removeFavariteHotelsHive(HotelModel hotelObj) {
    try {
      GetIt.I<Box>().delete(hotelObj.hotelId);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  bool checkIsFavaritedHotelsHive(HotelModel hotelObj) {
    try {
      return GetIt.I<Box>().containsKey(hotelObj.hotelId);
    } catch (e) {
      return false;
    }
  }
}
