import 'package:flutter/material.dart';

import '../../../../common/domain/date_time_service.dart';
import '../../../../dependency_injection/dependency_injection.dart';

class WorkoutDate extends StatelessWidget {
  const WorkoutDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: TextEditingController(
                text: getIt<DateTimeService>()
                    .formatToFullDateWithDayName(DateTime.now())),
            decoration: const InputDecoration(
              labelText: 'Workout Date',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
