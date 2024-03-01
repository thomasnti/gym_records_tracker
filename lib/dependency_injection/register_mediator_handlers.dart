import '../features/main_page/domain/usecases/register_handlers.dart';
import '../features/workout/domain/usecases/register_handlers.dart';

void registerMediatorHandlers() {
  registerWorkoutHandlers();
  registerMainPageHandlers();
}
