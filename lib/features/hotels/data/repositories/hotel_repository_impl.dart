import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failured.dart';
import 'package:hotel_booking/features/hotels/data/datasources/hotel_datasource_interface.dart';
import 'package:hotel_booking/features/hotels/data/models/hotels_search_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:hotel_booking/features/hotels/domain/repositories/hotel_repository.dart';
import 'package:http/http.dart' as http;

class HotelRepositoryImpl implements HotelRepository {
  final HotelDatasourceInterface hotelDatasource;

  HotelRepositoryImpl({required this.hotelDatasource});

  @override
  Future<Either<Failure, HotelSearchModel>> fetchHotelsListApi() async {
    try {
      http.Response response = await hotelDatasource.fetchHotelsListApi();
      if (response.statusCode == 200) {
        HotelSearchModel hotelSearch = HotelSearchModel.fromJson(jsonDecode(response.body));
        return Right(hotelSearch);
      } else if (response.statusCode == 500) {
        return const Left(ServerFailure("Internal Server Error"));
      } else {
        return const Left(ServerFailure("Server Failure"));
      }
    } catch (e) {
      return const Left(ServerFailure("Try Again Later"));
    }
  }

  @override
  Either<Failure, bool> addFavariteHotelsHive() {
    // TODO: implement addFavariteHotelsHive
    throw UnimplementedError();
  }

  @override
  Either<Failure, List<Hotel>> getFavariteHotelsHive() {
    // TODO: implement getFavariteHotelsHive
    throw UnimplementedError();
  }

  @override
  Either<Failure, bool> removeFavariteHotelsHive() {
    // TODO: implement removeFavariteHotelsHive
    throw UnimplementedError();
  }
}
