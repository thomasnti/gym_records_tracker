part of 'main_page_cubit.dart';

class MainPageState extends Equatable {
  final int tabIndex;

  const MainPageState({
    required this.tabIndex,
  });

  @override
  List<Object> get props => [tabIndex];
}
