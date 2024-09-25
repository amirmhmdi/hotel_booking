import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failured.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotels_search.dart';
import 'package:hotel_booking/features/hotels/domain/repositories/hotel_repository.dart';

class FetchHotelsListApiUsecase {
  final HotelRepository repository;
  FetchHotelsListApiUsecase({required this.repository});

  Future<Either<Failure, HotelSearch>> call() async {
    return await repository.fetchHotelsListApi();
  }
}
