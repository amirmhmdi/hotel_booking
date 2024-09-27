import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking/features/hotels/presentation/bloc/hotels_bloc/hotels_bloc.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/hotel_appbar.dart';

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
        builder: (context, state) {
          print(state);
          return Container(
            alignment: Alignment.center,
            child: const Text("Will be implemented soon"),
          );
        },
      ),
    );
  }
}
