import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hotel_booking/core/router/app_router.dart';
import 'package:hotel_booking/features/hotels/data/datasources/hotel_datasource_impl.dart';
import 'package:hotel_booking/features/hotels/data/repositories/hotel_repository_impl.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/add_favorite_hotels_hive.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/check_is_favorited_hotel_hive.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/fetch_hotels_list_api_usecase.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/get_favorite_hotels_hive.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/remove_favorite_hotels_hive.dart';
import 'package:hotel_booking/features/hotels/presentation/bloc/hotels_bloc/hotels_bloc.dart';

Future<void> setupGetIt() async {
  GetIt.I.registerSingleton<Box>(await Hive.openBox('FavoriteBox'));
  GetIt.I.registerSingleton<AppRouter>(AppRouter());
  
  GetIt.I.registerSingleton<HotelDatasourceImpl>(HotelDatasourceImpl());
  GetIt.I.registerSingleton<HotelRepositoryImpl>(HotelRepositoryImpl(hotelDatasource: GetIt.I<HotelDatasourceImpl>()));

  GetIt.I.registerSingleton<AddFavoriteHotelsHive>(AddFavoriteHotelsHive(repository: GetIt.I<HotelRepositoryImpl>()));
  GetIt.I.registerSingleton<FetchHotelsListApiUsecase>(FetchHotelsListApiUsecase(repository: GetIt.I<HotelRepositoryImpl>()));
  GetIt.I.registerSingleton<GetFavoriteHotelsHive>(GetFavoriteHotelsHive(repository: GetIt.I<HotelRepositoryImpl>()));
  GetIt.I.registerSingleton<RemoveFavoriteHotelsHive>(RemoveFavoriteHotelsHive(repository: GetIt.I<HotelRepositoryImpl>()));
  GetIt.I.registerSingleton<CheckIsFavoritedHotelHive>(CheckIsFavoritedHotelHive(repository: GetIt.I<HotelRepositoryImpl>()));

  GetIt.I.registerSingleton<HotelsBloc>(
    HotelsBloc(
      addFavoriteHotelsHive: GetIt.I<AddFavoriteHotelsHive>(),
      fetchHotelsListApiUsecase: GetIt.I<FetchHotelsListApiUsecase>(),
      getFavoriteHotelsHive: GetIt.I<GetFavoriteHotelsHive>(),
      removeFavoriteHotelsHive: GetIt.I<RemoveFavoriteHotelsHive>(),
      checkIsFavoritedHotelHive: GetIt.I<CheckIsFavoritedHotelHive>(),
    ),
  );
}
