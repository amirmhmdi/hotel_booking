import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:hotel_booking/features/hotels/presentation/bloc/hotels_bloc/hotels_bloc.dart';

class HotelImageStackWidget extends StatefulWidget {
  final Hotel hotelObj;
  final bool showRating;
  const HotelImageStackWidget({
    super.key,
    required this.hotelObj,
    required this.showRating,
  });

  @override
  State<HotelImageStackWidget> createState() => _HotelImageStackWidgetState();
}

class _HotelImageStackWidgetState extends State<HotelImageStackWidget> {
  bool isFirstNullInLoadingProcess = true;
  @override
  Widget build(BuildContext context) {
    GetIt.I<HotelsBloc>().add(CheckIsFavoritedEvent(hotel: widget.hotelObj));
    return Stack(
      children: [
        Image.network(
          widget.hotelObj.images.first.small,
          width: double.infinity,
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null && isFirstNullInLoadingProcess == false) {
              return child;
            } else {
              isFirstNullInLoadingProcess = false;
              return SizedBox(
                height: 300,
                child: Center(child: child),
              );
            }
          },
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: BlocConsumer<HotelsBloc, HotelsState>(
              listenWhen: (previous, current) => current is FavoriteHotelFailurState,
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text((state as FavoriteHotelFailurState).message)));
              },
              buildWhen: (previous, current) => (current is IsFavoritedHotelState && current.hotel.hotelId == widget.hotelObj.hotelId),
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    if (state is IsFavoritedHotelState && state.hotel.hotelId == widget.hotelObj.hotelId && state.isFavorited) {
                      GetIt.I<HotelsBloc>().add(RemoveFavoriteEvent(hotel: widget.hotelObj));
                    } else {
                      GetIt.I<HotelsBloc>().add(AddFavoriteEvent(hotel: widget.hotelObj));
                    }
                  },
                  padding: const EdgeInsets.all(8.0),
                  icon: Icon(
                    Icons.favorite,
                    color: (state is IsFavoritedHotelState && state.hotel.hotelId == widget.hotelObj.hotelId && state.isFavorited) ? Colors.red : Colors.white,
                  ),
                );
              },
            ),
          ),
        ),
        if (widget.showRating)
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "🙂 ${widget.hotelObj.ratingInfo.score} / 5.0",
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${widget.hotelObj.ratingInfo.scoreDescription} (${widget.hotelObj.ratingInfo.reviewsCount} Bew.)",
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
