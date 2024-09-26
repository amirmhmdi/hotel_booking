import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MyApp.page,
          initial: true,
          children: [
            AutoRoute(page: Overview.page),
            AutoRoute(page: Search.page),
            AutoRoute(page: Favorites.page),
            AutoRoute(page: Account.page),
          ],
        ),
      ];
}
