import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking/features/hotels/presentation/bloc/hotels_bloc/hotels_bloc.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/hotel_appbar.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/overview_item_widget.dart';
import 'package:intl/intl.dart';

@RoutePage(name: "overview")
class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  late HotelsBloc _hotelsBloc;
  @override
  void initState() {
    _hotelsBloc = GetIt.I<HotelsBloc>()..add(HotelsFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HotelAppbar(appbarTitle: "Hotels"),
      body: BlocBuilder<HotelsBloc, HotelsState>(
        buildWhen: (previous, current) => (current is HotelsLoadingState || current is HotelsLoadedState || current is HotelsFetchFailedState),
        builder: (context, state) {
          if (state is HotelsLoadingState) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          } else if (state is HotelsLoadedState) {
            return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                itemCount: state.hotelSearch.hotels.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Text(
                      "${NumberFormat("###,###.###", "tr_TR").format(state.hotelSearch.hotelCount)} Hotels für ${state.hotelSearch.usedSearchRequest.destination.split("-").last}",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    );
                  }
                  return OverviewItemWidget(hotelObj: state.hotelSearch.hotels[index - 1]);
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
                        _hotelsBloc.add(HotelsFetchEvent());
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
