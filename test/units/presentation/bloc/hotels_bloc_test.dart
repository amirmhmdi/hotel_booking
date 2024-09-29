import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/core/error/failured.dart';
import 'package:hotel_booking/features/hotels/data/models/hotels_search_model.dart';
import 'package:hotel_booking/features/hotels/data/repositories/hotel_repository_impl.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/add_favorite_hotels_hive.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/check_is_favorited_hotel_hive.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/fetch_hotels_list_api_usecase.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/get_favorite_hotels_hive.dart';
import 'package:hotel_booking/features/hotels/domain/usecases/remove_favorite_hotels_hive.dart';
import 'package:hotel_booking/features/hotels/presentation/bloc/hotels_bloc/hotels_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../assets/hotel_search_josn.dart';

class MockRepository extends Mock implements HotelRepositoryImpl {}

void main() {
  group("Fetch Hotels Bloc", () {
    late MockRepository mockRepository;
    late AddFavoriteHotelsHive addFavoriteHotelsHive;
    late CheckIsFavoritedHotelHive checkIsFavoritedHotelHive;
    late FetchHotelsListApiUsecase fetchHotelsListApiUsecase;
    late GetFavoriteHotelsHive getFavoriteHotelsHive;
    late RemoveFavoriteHotelsHive removeFavoriteHotelsHive;
    late HotelSearchModel hotelSearchModel;
    late List<Hotel> listHotel;

    setUp(() {
      mockRepository = MockRepository();
      addFavoriteHotelsHive = AddFavoriteHotelsHive(repository: mockRepository);
      checkIsFavoritedHotelHive = CheckIsFavoritedHotelHive(repository: mockRepository);
      fetchHotelsListApiUsecase = FetchHotelsListApiUsecase(repository: mockRepository);
      getFavoriteHotelsHive = GetFavoriteHotelsHive(repository: mockRepository);
      removeFavoriteHotelsHive = RemoveFavoriteHotelsHive(repository: mockRepository);
      hotelSearchModel = HotelSearchModel.fromJson(hotelSearchJson);
      listHotel = hotelSearchModel.hotels;
    });

    blocTest<HotelsBloc, HotelsState>(
      'Fetch Hotels List Right',
      setUp: () => when(() => mockRepository.fetchHotelsListApi()).thenAnswer((realInvocation) async => Right(hotelSearchModel)),
      build: () => HotelsBloc(
        addFavoriteHotelsHive: addFavoriteHotelsHive,
        checkIsFavoritedHotelHive: checkIsFavoritedHotelHive,
        fetchHotelsListApiUsecase: fetchHotelsListApiUsecase,
        getFavoriteHotelsHive: getFavoriteHotelsHive,
        removeFavoriteHotelsHive: removeFavoriteHotelsHive,
      ),
      act: (bloc) => bloc.add(HotelsFetchEvent()),
      expect: () => <HotelsState>[
        HotelsLoadingState(),
        HotelsLoadedState(hotelSearch: hotelSearchModel),
      ],
    );

    blocTest<HotelsBloc, HotelsState>(
      'Fetch Hotels List Left',
      setUp: () => when(() => mockRepository.fetchHotelsListApi()).thenAnswer((realInvocation) async => const Left(ServerFailure("ServerFailure"))),
      build: () => HotelsBloc(
        addFavoriteHotelsHive: addFavoriteHotelsHive,
        checkIsFavoritedHotelHive: checkIsFavoritedHotelHive,
        fetchHotelsListApiUsecase: fetchHotelsListApiUsecase,
        getFavoriteHotelsHive: getFavoriteHotelsHive,
        removeFavoriteHotelsHive: removeFavoriteHotelsHive,
      ),
      act: (bloc) => bloc.add(HotelsFetchEvent()),
      expect: () => <HotelsState>[
        HotelsLoadingState(),
        const HotelsFetchFailedState(failureMessage: "ServerFailure"),
      ],
    );

    group("Fetch Favorite List Bloc", () {
      blocTest<HotelsBloc, HotelsState>(
        'Fetch Favorite List Right',
        setUp: () => when(() => mockRepository.getFavariteHotelsHive()).thenAnswer((realInvocation) => Right(listHotel)),
        build: () => HotelsBloc(
          addFavoriteHotelsHive: addFavoriteHotelsHive,
          checkIsFavoritedHotelHive: checkIsFavoritedHotelHive,
          fetchHotelsListApiUsecase: fetchHotelsListApiUsecase,
          getFavoriteHotelsHive: getFavoriteHotelsHive,
          removeFavoriteHotelsHive: removeFavoriteHotelsHive,
        ),
        act: (bloc) => bloc.add(GetFavoritesEvent()),
        expect: () => <HotelsState>[
          const FavoriteHotelsListLoadingState(),
          FavoriteHotelsListLoadedState(hotelsList: listHotel),
        ],
      );

      blocTest<HotelsBloc, HotelsState>(
        'Fetch Favorite List Left',
        setUp: () => when(() => mockRepository.getFavariteHotelsHive()).thenAnswer((realInvocation) => const Left(DatabaseFailure("DatabaseFailure"))),
        build: () => HotelsBloc(
          addFavoriteHotelsHive: addFavoriteHotelsHive,
          checkIsFavoritedHotelHive: checkIsFavoritedHotelHive,
          fetchHotelsListApiUsecase: fetchHotelsListApiUsecase,
          getFavoriteHotelsHive: getFavoriteHotelsHive,
          removeFavoriteHotelsHive: removeFavoriteHotelsHive,
        ),
        act: (bloc) => bloc.add(GetFavoritesEvent()),
        expect: () => <HotelsState>[
          const FavoriteHotelsListLoadingState(),
          const FavoriteHotelListFailurState(message: "DatabaseFailure"),
        ],
      );
    });
  });
}
