import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/hotel_appbar.dart';

@RoutePage(name: "favorites")
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HotelAppbar(appbarTitle: "Favorites"),
      body: Container(
        alignment: Alignment.center,
        child: const Text("Will be implemented soon"),
      ),
    );
  }
}