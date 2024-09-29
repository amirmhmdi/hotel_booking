part of 'hotels_bloc.dart';

sealed class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

final class HotelsLoadingState extends HotelsState {
  @override
  List<Object> get props => [];
}

final class HotelsLoadedState extends HotelsState {
  final HotelSearch hotelSearch;

  const HotelsLoadedState({required this.hotelSearch});
  @override
  List<Object> get props => [];
}

final class HotelsFetchFailedState extends HotelsState {
  final String failureMessage;

  const HotelsFetchFailedState({required this.failureMessage});

  @override
  List<Object> get props => [];
}

//

final class IsFavoritedHotelState extends HotelsState {
  final Hotel hotel;
  final bool isFavorited;

  const IsFavoritedHotelState({required this.hotel, required this.isFavorited});

  @override
  List<Object> get props => [hotel, isFavorited];
}

final class FavoriteHotelFailurState extends HotelsState {
  final String message;

  const FavoriteHotelFailurState({required this.message});

  @override
  List<Object> get props => [];
}

//

final class FavoriteHotelsListLoadedState extends HotelsState {
  final List<Hotel> hotelsList;

  const FavoriteHotelsListLoadedState({required this.hotelsList});

  @override
  List<Object> get props => [];
}

final class FavoriteHotelsListLoadingState extends HotelsState {
  const FavoriteHotelsListLoadingState();

  @override
  List<Object> get props => [];
}

final class FavoriteHotelListFailurState extends HotelsState {
  final String message;

  const FavoriteHotelListFailurState({required this.message});

  @override
  List<Object> get props => [];
}
