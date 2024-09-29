part of 'hotels_bloc.dart';

sealed class HotelsEvent extends Equatable {
  const HotelsEvent();

  @override
  List<Object> get props => [];
}

final class HotelsFetchEvent extends HotelsEvent {
  @override
  List<Object> get props => [];
}

final class CheckIsFavoritedEvent extends HotelsEvent {
  final Hotel hotel;

  const CheckIsFavoritedEvent({required this.hotel});
  @override
  List<Object> get props => [];
}

final class AddFavoriteEvent extends HotelsEvent {
  final Hotel hotel;

  const AddFavoriteEvent({required this.hotel});
  @override
  List<Object> get props => [];
}

final class RemoveFavoriteEvent extends HotelsEvent {
  final Hotel hotel;

  const RemoveFavoriteEvent({required this.hotel});
  @override
  List<Object> get props => [];
}

final class GetFavoritesEvent extends HotelsEvent {
  @override
  List<Object> get props => [];
}
