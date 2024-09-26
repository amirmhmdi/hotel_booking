import 'package:flutter/material.dart';

class HotelAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String appbarTitle;
  const HotelAppbar({super.key, required this.appbarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appbarTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blue.shade900,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
