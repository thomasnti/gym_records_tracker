import 'package:flutter/material.dart';
import 'package:gym_records_tracker/common/add_workout_button.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _selectedTab = 0;

  static const List tabPages = [
    Text('HERE YOU MUST SEE PREVIOUS EXERCISES'),
    Text('A LIST OF ALL AVAILABLE EXERCISES (CATEGORIZED BY Muscle Group )'),
    Text('Statistics - i dont know what'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gym Records'),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          items: getTabBarItems(),
          onTap: onTabBarItemTap,
        ),
        body: Center(child: tabPages[_selectedTab]),
        floatingActionButton: const AddWorkoutButton(),
      ),
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
      BottomNavigationBarItem(
        icon: Icon(Icons.leaderboard),
        label: 'Statistics',
      )
    ];
  }

  void onTabBarItemTap(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
}
