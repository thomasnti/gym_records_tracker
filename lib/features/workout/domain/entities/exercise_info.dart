import 'body_parts.dart';

class ExerciseInfo {
  final String name;
  final BodyParts bodyPart;
  final String exerciseGifPath;
  final List<String> instructions;

  ExerciseInfo(
    this.name,
    this.bodyPart,
    this.exerciseGifPath,
    this.instructions,
  );

  String get fullGifPath => 'assets/exercises/$exerciseGifPath.gif';
}
