import 'package:flutter/material.dart';

import 'common/bottom_tab_bar.dart';

void main() {
  runApp(const GymRecords());
}

class GymRecords extends StatelessWidget {
  const GymRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomTabBar(),
    );
  }
}
