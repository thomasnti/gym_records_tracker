part of 'main_page_cubit.dart';

class MainPageState extends Equatable {
  final int tabIndex;
  final ThemeMode themeMode;

  const MainPageState({
    required this.tabIndex,
    this.themeMode = ThemeMode.light,
  });

  MainPageState copyWith({
    int? tabIndex,
    ThemeMode? themeMode,
  }) =>
      MainPageState(
        tabIndex: tabIndex ?? this.tabIndex,
        themeMode: themeMode ?? this.themeMode,
      );

  @override
  List<Object> get props => [
        tabIndex,
        themeMode,
      ];
}
