import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/hotel_appbar.dart';

@RoutePage(name: "search")
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HotelAppbar(appbarTitle: "Search"),
      body: Container(
        alignment: Alignment.center,
        child: const Text("Will be implemented soon"),
      ),
    );
  }
}
