import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_records_tracker/features/main_page/presentation/cubit/main_page_cubit.dart';

void main() {
  late MainPageCubit mainPageCubit;

  setUp(() {
    mainPageCubit = MainPageCubit();
  });

  group('MainPageCubit', () {
    test('should have this specific initial state', () {
      expect(
          mainPageCubit.state,
          const MainPageState(
            tabIndex: 0,
            themeMode: ThemeMode.light,
          ));
    });

    blocTest<MainPageCubit, MainPageState>(
      'emits new tabIndex when changeTabIndex is called.',
      build: () => mainPageCubit,
      act: (cubit) => cubit.changeTabIndex(1),
      expect: () => [
        mainPageCubit.state.copyWith(tabIndex: 1),
      ],
    );

    blocTest<MainPageCubit, MainPageState>(
      'emits new themeMode when changeThemeMode is called.',
      seed: () => mainPageCubit.state.copyWith(
        themeMode: ThemeMode.light,
      ),
      build: () => mainPageCubit,
      act: (cubit) => cubit.changeThemeMode(),
      expect: () => [
        mainPageCubit.state.copyWith(themeMode: ThemeMode.dark),
      ],
    );
  });
}
