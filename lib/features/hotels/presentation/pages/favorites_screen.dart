import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking/features/hotels/presentation/bloc/hotels_bloc/hotels_bloc.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/favorite_item_widget.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/hotel_appbar.dart';

@RoutePage(name: "favorites")
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late HotelsBloc _hotelsBloc;

  @override
  void initState() {
    _hotelsBloc = GetIt.I<HotelsBloc>()..add(GetFavoritesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HotelAppbar(appbarTitle: "Favorites"),
      body: BlocBuilder<HotelsBloc, HotelsState>(
        buildWhen: (previous, current) => (current is FavoriteHotelsListLoadedState || current is FavoriteHotelsListLoadingState || current is FavoriteHotelListFailurState),
        builder: (context, state) {
          if (state is FavoriteHotelsListLoadingState) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          } else if (state is FavoriteHotelsListLoadedState) {
            return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                itemCount: state.hotelsList.length,
                itemBuilder: (context, index) {
                  return FavoriteItemWidget(hotelObj: state.hotelsList[index]);
                });
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Sorry! Some thing went wrong!"),
                  if (state is HotelsFetchFailedState) Text(state.failureMessage),
                  TextButton(
                      onPressed: () {
                        _hotelsBloc.add(GetFavoritesEvent());
                      },
                      child: const Text("Try Again")),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
