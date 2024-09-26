import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/router/app_router.gr.dart';

@RoutePage(name: "myApp")
class HotelBookingMainScreen extends StatelessWidget {
  const HotelBookingMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        Overview(),
        Search(),
        Favorites(),
        Account(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(label: 'Overview', icon: Icon(Icons.home_outlined)),
              BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
              BottomNavigationBarItem(label: 'Favorites', icon: Icon(Icons.favorite_border)),
              BottomNavigationBarItem(label: 'Account', icon: Icon(Icons.account_circle_outlined)),
            ],
          ),
        );
      },
    );
  }
}
