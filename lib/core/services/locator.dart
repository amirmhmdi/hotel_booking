import 'package:get_it/get_it.dart';
import 'package:hotel_booking/core/router/app_router.dart';
import 'package:hotel_booking/features/hotels/presentation/bloc/hotels_bloc/hotels_bloc.dart';

Future<void> setupGetIt() async {
  GetIt.I.registerSingleton<AppRouter>(AppRouter());

  GetIt.I.registerSingleton<HotelsBloc>(HotelsBloc());
}
