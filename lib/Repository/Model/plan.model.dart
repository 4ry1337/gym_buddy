import 'package:isar/isar.dart';
import 'package:gym_buddy/Repository/Model/routine.model.dart';

part 'plan.model.g.dart';

@collection
class Plan {
  Id id;

  @Backlink(to: 'plan')
  final routines = IsarLinks<Routine>();

  Plan({
    this.id = Isar.autoIncrement,
  });

  Map<String, dynamic> toJSON() => {};
}