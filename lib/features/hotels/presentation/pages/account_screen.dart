import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/hotel_appbar.dart';

@RoutePage(name: "account")
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HotelAppbar(appbarTitle: "Account"),
      body: Container(
        alignment: Alignment.center,
        child: const Text("Will be implemented soon"),
      ),
    );
  }
}
