import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../workout/presentation/pages/exercises_page.dart';
import '../cubit/main_page_cubit.dart';
import '../widgets/bottom_nav_bar.dart';
import 'workout_log_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> tabPages = [
    const WorkoutLogPage(),
    const ExercisesPage(),
    // const Text(
    const Text('Statistics - i dont know what'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gym Records'),
        centerTitle: true,
      ),
      body: BlocBuilder<MainPageCubit, MainPageState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.tabIndex,
            children: tabPages,
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}