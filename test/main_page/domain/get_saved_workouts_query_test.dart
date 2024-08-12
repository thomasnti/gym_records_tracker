import 'package:flutter_test/flutter_test.dart';
import 'package:gym_records_tracker/common/domain/services/date_time_service.dart';
import 'package:gym_records_tracker/features/main_page/domain/usecases/get_saved_workouts_query.dart';
import 'package:gym_records_tracker/features/workout/domain/repositories/workout_repo.dart';
import 'package:mocktail/mocktail.dart';

class MockWorkoutRepo extends Mock implements WorkoutRepo {}

class MockDateTimeService extends Mock implements DateTimeService {}

void main() {
  late MockWorkoutRepo mockWorkoutRepo;
  late MockDateTimeService mockDateTimeService;
  // class under test
  late GetSavedWorkoutsQueryHandler getSavedWorkoutsQueryHandler;

  setUp(() {
    mockWorkoutRepo = MockWorkoutRepo();
    mockDateTimeService = MockDateTimeService();

    getSavedWorkoutsQueryHandler = GetSavedWorkoutsQueryHandler(
      mockWorkoutRepo,
      mockDateTimeService,
    );
  });

  group('GetSavedWorkoutsQueryHandler', () {
    test('should read workouts from repo and add fullDateParts, endTime for each workout ',
        () async {
      //arange
      //todo: get test workout data
      //act
      // final result = await getSavedWorkoutsQueryHandler(GetSavedWorkoutsQuery());
      //assert
      // expect result.length ιδιο με το test data
      // _dateTimeService.getFullDateParts called N times
    });
  });
}
