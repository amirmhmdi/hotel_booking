// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:hotel_booking/features/hotels/presentation/pages/account_screen.dart'
    as _i1;
import 'package:hotel_booking/features/hotels/presentation/pages/favorites_screen.dart'
    as _i2;
import 'package:hotel_booking/features/hotels/presentation/pages/hotel_booking_main_screen.dart'
    as _i3;
import 'package:hotel_booking/features/hotels/presentation/pages/overview_screen.dart'
    as _i4;
import 'package:hotel_booking/features/hotels/presentation/pages/search_screen.dart'
    as _i5;

/// generated route for
/// [_i1.AccountScreen]
class Account extends _i6.PageRouteInfo<void> {
  const Account({List<_i6.PageRouteInfo>? children})
      : super(
          Account.name,
          initialChildren: children,
        );

  static const String name = 'Account';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountScreen();
    },
  );
}

/// generated route for
/// [_i2.FavoritesScreen]
class Favorites extends _i6.PageRouteInfo<void> {
  const Favorites({List<_i6.PageRouteInfo>? children})
      : super(
          Favorites.name,
          initialChildren: children,
        );

  static const String name = 'Favorites';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavoritesScreen();
    },
  );
}

/// generated route for
/// [_i3.HotelBookingMainScreen]
class MyApp extends _i6.PageRouteInfo<void> {
  const MyApp({List<_i6.PageRouteInfo>? children})
      : super(
          MyApp.name,
          initialChildren: children,
        );

  static const String name = 'MyApp';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HotelBookingMainScreen();
    },
  );
}

/// generated route for
/// [_i4.OverviewScreen]
class Overview extends _i6.PageRouteInfo<void> {
  const Overview({List<_i6.PageRouteInfo>? children})
      : super(
          Overview.name,
          initialChildren: children,
        );

  static const String name = 'Overview';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.OverviewScreen();
    },
  );
}

/// generated route for
/// [_i5.SearchScreen]
class Search extends _i6.PageRouteInfo<void> {
  const Search({List<_i6.PageRouteInfo>? children})
      : super(
          Search.name,
          initialChildren: children,
        );

  static const String name = 'Search';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SearchScreen();
    },
  );
}
