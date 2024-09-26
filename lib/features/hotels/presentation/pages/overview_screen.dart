import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/hotel_appbar.dart';

@RoutePage(name: "overview")
class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HotelAppbar(appbarTitle: "Hotels"),
      body: Container(
        alignment: Alignment.center,
        child: const Text("Will be implemented soon"),
      ),
    );
  }
}
