import '../domain/entities/body_parts.dart';
import '../domain/entities/exercise_info.dart';

List<ExerciseInfo> exercisesData = [
  ExerciseInfo('Bench Press', BodyParts.chest, 'barbell_bench_press', [
    'Lie flat on a bench with your feet planted firmly on the floor.',
    'Grip the barbell slightly wider than shoulder-width apart, lowering it to your chest.',
    'Press the barbell upward until your arms are fully extended, then lower it back down under control.'
  ]),
  ExerciseInfo('Barbell Row', BodyParts.back, 'barbell_row', [
    'Stand with your feet shoulder-width apart, holding a barbell with an overhand grip.',
    'Bend your knees slightly and hinge at your hips, keeping your back straight.',
    'Pull the barbell towards your lower chest, squeezing your shoulder blades together, then lower it back down with control.',
  ]),
  ExerciseInfo(
      'Seated Barbell Shoulder Press', BodyParts.shoulders, 'smith_seated_shoulder_press', [
    'Sit on a bench with back support, holding a barbell at shoulder height with an overhand grip.',
    'Press the barbell overhead until your arms are fully extended, then lower it back down to shoulder height.',
  ]),
  ExerciseInfo('Pull-ups', BodyParts.back, 'pull_ups', [
    'Grip a pull-up bar with your hands slightly wider than shoulder-width apart, palms facing away.',
    'Hang from the bar with your arms fully extended, then pull yourself up until your chin is above the bar.',
    'Lower yourself back down to the starting position with control.',
  ]),
  ExerciseInfo('Bicep curls', BodyParts.biceps, 'dumbbell_seated_bicep_curl', [
    'Stand with your feet shoulder-width apart, holding a barbell or dumbbells with an underhand grip.',
    'Curl the weight upwards towards your shoulders, keeping your elbows close to your body.',
    'Lower the weight back down to the starting position under control.',
  ]),
  ExerciseInfo('Tricep extension', BodyParts.triceps, 'cable_rope_tricep_extension', [
    'Stand or sit with a dumbbell held above your head with both hands.',
    'Lower the dumbbell behind your head by bending your elbows, then extend your arms to lift it back up to the starting position.',
  ]),
  ExerciseInfo('Incline Smith Machine Bench Press', BodyParts.chest, 'smith_incline_bench_press', [
    'Lie on an incline bench set at a 30-45 degree angle, grasping the barbell with a shoulder-width grip.',
    'Lower the barbell to your upper chest, then press it back up to the starting position.',
  ]),
  ExerciseInfo(
      'Seated Lateral Raise', BodyParts.shoulders, 'dumbbell_seated_bent_arm_lateral_raise', [
    'Sit on a bench with a dumbbell in each hand, palms facing inward.',
    'Raise the dumbbells out to the sides until your arms are parallel to the ground, then lower them back down.',
  ]),
  ExerciseInfo('Arnold Press', BodyParts.shoulders, 'arnold_press', [
    'Sit on a bench with back support, holding a dumbbell in each hand at shoulder height with palms facing towards you.',
    'Press the dumbbells overhead, rotating your palms outward as you extend your arms, then reverse the motion to return to the starting position.',
  ]),
  ExerciseInfo('Dips', BodyParts.chest, 'chest_dips', [
    'Grip parallel bars with your arms fully extended and your body upright.',
    'Lower your body by bending your elbows until your upper arms are parallel to the ground, then push yourself back up to the starting position.',
  ]),
  ExerciseInfo('Lat Pull-down', BodyParts.back, 'lat_pulldown', [
    // todo: this instructions are wrong
    'Sit at a lat pull-down machine with your knees secured under the pads.',
    'Grasp the bar with an overhand grip slightly wider than shoulder-width apart, then pull it down towards your chest, squeezing your shoulder blades together.',
    'Slowly release the bar back up to the starting position.',
  ]),
  ExerciseInfo('Seated Cable Row', BodyParts.back, 'seated_cable_row', [
    'Sit at a cable row machine with your knees slightly bent and feet placed firmly on the foot pads.',
    'Grasp the handles with an overhand grip, then pull them towards your torso, squeezing your shoulder blades together.',
    'Slowly release the handles back to the starting position.',
  ]),
  ExerciseInfo('Machine Chest Press', BodyParts.chest, 'machine_chest_press', [
    'Sit at a chest press machine with your back against the backrest.',
    'Grasp the handles with a shoulder-width grip, then push them forward until your arms are fully extended.',
    'Slowly release the handles back to the starting position.',
  ]),
  ExerciseInfo('Chest fly', BodyParts.chest, 'chest_fly', [
    'Lie on a flat bench with a dumbbell in each hand, palms facing inward.',
    'Extend your arms above your chest, then lower the dumbbells out to the sides in a wide arc until you feel a stretch in your chest.',
    'Bring the dumbbells back together over your chest, squeezing your chest muscles at the top of the movement.',
  ]),
  ExerciseInfo('Squats', BodyParts.legs, 'barbell_squat', [
    'Stand with your feet shoulder-width apart, holding a barbell across your upper back.',
    'Squat down by bending your knees and pushing your hips back, keeping your chest up and back straight.',
    'Lower yourself until your thighs are parallel to the ground, then push through your heels to return to the starting position.',
  ]),
  ExerciseInfo('Smith Squats', BodyParts.legs, 'smith_squat', [
    'Stand with your feet shoulder-width apart inside a Smith machine, with the barbell across your upper back.',
    'Squat down by bending your knees and pushing your hips back, keeping your chest up and back straight.',
    'Lower yourself until your thighs are parallel to the ground, then push through your heels to return to the starting position.',
  ]),
  ExerciseInfo('Calf Raises', BodyParts.legs, 'calf_raises', [
    'Stand on a raised platform with your heels hanging off the edge, holding onto a support for balance if needed.',
    'Rise up onto your toes as high as possible, then lower your heels back down below the level of the platform.',
    'Repeat for the desired number of repetitions, focusing on squeezing your calf muscles at the top of the movement.',
  ]),
];
