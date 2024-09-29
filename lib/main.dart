import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hotel_booking/core/router/app_router.dart';
import 'package:hotel_booking/core/services/locator.dart';
import 'package:hotel_booking/features/hotels/presentation/bloc/hotels_bloc/hotels_bloc.dart';

void main() async {
  await Hive.initFlutter();
  await setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<HotelsBloc>(),
      child: MaterialApp.router(
        routerConfig: GetIt.I<AppRouter>().config(),
      ),
    );
  }
}
