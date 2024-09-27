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
  bool addFavariteHotelsHive() {
    // TODO: implement addFavariteHotelsHive
    throw UnimplementedError();
  }

  @override
  List<HotelModel> getFavariteHotelsHive() {
    // TODO: implement getFavariteHotelsHive
    throw UnimplementedError();
  }

  @override
  bool removeFavariteHotelsHive() {
    // TODO: implement removeFavariteHotelsHive
    throw UnimplementedError();
  }
}
