import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit()
      : super(
          const MainPageState(tabIndex: 0),
        );

  void changeTabIndex(int index) {
    final MainPageState newState = MainPageState(tabIndex: index);

    emit(newState);
  }
}
