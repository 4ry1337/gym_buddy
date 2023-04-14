class ExerciseModel {
  String id;
  String name;
  String? description;
  String? kg;
  int? sets;
  int? reps;
  int? time;
  int? restTime;
  ExerciseModel({
    required this.id,
    required this.name,
  });
}