import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failured.dart';
import 'package:hotel_booking/features/hotels/data/datasources/hotel_datasource_interface.dart';
import 'package:hotel_booking/features/hotels/data/models/hotel_model.dart';
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
  Either<Failure, bool> addFavariteHotelsHive(Hotel hotel) {
    try {
      bool isOkay = hotelDatasource.addFavariteHotelsHive(HotelModel.fromDomain(hotel));
      if (isOkay) {
        return const Right(true);
      } else {
        return const Left(DatabaseFailure("Database Failure!"));
      }
    } catch (e) {
      return const Left(DatabaseFailure("Database Failure!"));
    }
  }

  @override
  Either<Failure, List<Hotel>> getFavariteHotelsHive() {
    try {
      List<Hotel> hotelsList = hotelDatasource.getFavariteHotelsHive();
      return Right(hotelsList);
    } catch (e) {
      return const Left(DatabaseFailure("Database Failure!"));
    }
  }

  @override
  Either<Failure, bool> removeFavariteHotelsHive(Hotel hotel) {
    try {
      bool isOkay = hotelDatasource.removeFavariteHotelsHive(HotelModel.fromDomain(hotel));
      if (isOkay) {
        return const Right(true);
      } else {
        return const Left(DatabaseFailure("Database Failure!"));
      }
    } catch (e) {
      return const Left(DatabaseFailure("Database Failure!"));
    }
  }

  @override
  Either<Failure, bool> checkIsFavaritedHotelsHive(Hotel hotel) {
    try {
      bool isFavorited = hotelDatasource.checkIsFavaritedHotelsHive(HotelModel.fromDomain(hotel));
      if (isFavorited) {
        return Right(isFavorited);
      } else {
        return const Left(DatabaseFailure("Database Failure!"));
      }
    } catch (e) {
      return const Left(DatabaseFailure("Database Failure!"));
    }
  }
}
