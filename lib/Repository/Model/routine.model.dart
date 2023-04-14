import 'package:isar/isar.dart';
import 'package:gym_buddy/Repository/Model/plan.model.dart';
import 'package:gym_buddy/Repository/Model/exercise.model.dart';

part 'routine.model.g.dart';

@collection
class Routine {
  Id id;
  late String time;
  late String startDate;
  late String finishDate;
  late List<Exercise> exercises;

  final plan = IsarLink<Plan>();

  Routine({
    this.id = Isar.autoIncrement,
    required this.time,
    required this.startDate,
    required this.finishDate,
    this.exercises = const [],
  });
}