import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit()
      : super(
          const MainPageState(tabIndex: 0),
        );

  void changeTabIndex(int index) {
    emit(
      state.copyWith(tabIndex: index),
    );
  }

  void changeThemeMode() {
    final newTheme =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    emit(
      state.copyWith(themeMode: newTheme),
    );
  }
}
