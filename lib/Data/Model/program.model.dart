import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';

class ProgramModel {
  String? id;
  String title;
  String? ownedBy;
  String? createdBy;
  Timestamp? createdAt;
  int? currentWorkout;
  List<WorkoutModel> workouts;

  ProgramModel({
    this.id,
    required this.title,
    this.ownedBy,
    this.createdBy,
    this.createdAt,
    this.currentWorkout,
    required this.workouts,
  }) {
    createdAt = createdAt ?? Timestamp.now();
  }

  toJSON() {
    return {
      "title": title,
      "ownedBy": ownedBy,
      "currentWorkout": currentWorkout,
      "createdBy": createdBy,
      "createdAt": createdAt,
      "workouts": workouts.map((workout) {
        workout.toJSON();
      }),
    };
  }

  factory ProgramModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProgramModel(
        id: document.id,
        title: data["title"],
        currentWorkout: data["currentWorkout"],
        ownedBy: data["ownedBy"],
        createdBy: data["createdBy"],
        createdAt: data["createdAt"],
        workouts: List<WorkoutModel>.from(
            List<Map<String, dynamic>>.from(data['workouts'] ?? [])
                .map((workout) => WorkoutModel.fromMap(workout))
                ?? []
        )
    );
  }
}
