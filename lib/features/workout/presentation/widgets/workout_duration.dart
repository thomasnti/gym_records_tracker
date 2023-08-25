import 'package:flutter/material.dart';

import '../../../../common/domain/date_time_service.dart';
import '../../../../dependency_injection/dependency_injection.dart';

class WorkoutDuration extends StatelessWidget {
  const WorkoutDuration({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: TextField(
            controller: TextEditingController(
              text:
                  getIt<DateTimeService>().getHourMinuteFromDt(DateTime.now()),
            ),
            decoration: const InputDecoration(
              labelText: 'Start Time',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'End Time',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
