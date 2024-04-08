import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/main_page_cubit.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        return BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          items: getTabBarItems(),
          currentIndex: state.tabIndex,
          onTap: (index) => context.read<MainPageCubit>().changeTabIndex(index),
        );
      },
    );
  }

  List<BottomNavigationBarItem> getTabBarItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.history),
        label: 'Log',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.fitness_center),
        label: 'Exercises',
      ),
      //TODO: Implement later (comment out for version 1 in production)
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.leaderboard),
      //   label: 'Statistics',
      // )
    ];
  }

  void onTabBarItemTap(int index) {
    setState(() {});
  }
}
