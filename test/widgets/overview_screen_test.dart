import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking/features/hotels/data/models/hotel_model.dart';

import 'package:hotel_booking/features/hotels/data/models/hotels_search_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotels_search.dart';
import 'package:hotel_booking/features/hotels/presentation/pages/overview_screen.dart';
import 'package:hotel_booking/features/hotels/presentation/widgets/overview_item_widget.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/hotels/presentation/bloc/hotels_bloc/hotels_bloc.dart';

import '../assets/hotel_json_1.dart';
import '../assets/hotel_search_josn.dart';

class MockHotelsBloc extends MockBloc<HotelsEvent, HotelsState> implements HotelsBloc {}

void main() {
  late MockHotelsBloc mockHotelsBloc;

  setUp(() {
    mockHotelsBloc = MockHotelsBloc();

    GetIt.I.registerFactory<HotelsBloc>(() => mockHotelsBloc);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  testWidgets('displays CircularProgressIndicator at HotelsLoadingState', (WidgetTester tester) async {
    when(() => GetIt.I<HotelsBloc>().state).thenReturn(HotelsLoadingState());

    await tester.pumpWidget(
      BlocProvider<HotelsBloc>(
        create: (context) => GetIt.I<HotelsBloc>(),
        child: const MaterialApp(home: OverviewScreen()),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('displays error message and retry button at HotelsFetchFailedState', (WidgetTester tester) async {
    const String errorMessage = 'Network Error';
    when(() => GetIt.I<HotelsBloc>().state).thenReturn(const HotelsFetchFailedState(failureMessage: errorMessage));

    await tester.pumpWidget(
      BlocProvider<HotelsBloc>(
        create: (context) => GetIt.I<HotelsBloc>(),
        child: const MaterialApp(home: OverviewScreen()),
      ),
    );

    expect(find.text('Sorry! Some thing went wrong!'), findsOneWidget);
    expect(find.text(errorMessage), findsOneWidget);
    expect(find.text('Try Again'), findsOneWidget);
  });

  testWidgets('retry button taping', (WidgetTester tester) async {
    when(() => GetIt.I<HotelsBloc>().state).thenReturn(const HotelsFetchFailedState(failureMessage: 'Network Error'));

    await tester.pumpWidget(
      BlocProvider<HotelsBloc>(
        create: (context) => GetIt.I<HotelsBloc>(),
        child: const MaterialApp(home: OverviewScreen()),
      ),
    );

    await tester.tap(find.text('Try Again'));
    await tester.pump();

    verify(() => GetIt.I<HotelsBloc>().add(HotelsFetchEvent())).called(2);
  });
}
