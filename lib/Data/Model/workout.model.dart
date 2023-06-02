import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.model.dart';

class WorkoutModel {
  String? id;
  String title;
  String? ownedBy;
  String? createdBy;
  Timestamp? createdAt;
  List<ExerciseModel> exercises;

  WorkoutModel({
    this.id,
    required this.title,
    required this.exercises,
    this.createdAt,
    this.createdBy,
    this.ownedBy,
  }) {
    createdAt = createdAt ?? Timestamp.now();
  }

  toJSON() {
    return {
      "title": title,
      "ownedBy": ownedBy,
      "createdBy": createdBy,
      "createdAt": createdAt,
      "exercises": exercises,
    };
  }

  factory WorkoutModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return WorkoutModel(
      id: document.id,
      title: data["title"],
      ownedBy: data["ownedBy"],
      createdBy: data["createdBy"],
      createdAt: data["createdAt"],
      exercises: List<ExerciseModel>.from(
          List<Map<String, dynamic>>.from(data['exercises'] ?? [])
              .map((exercise) => ExerciseModel.fromMap(exercise))),
    );
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> document) {
    return WorkoutModel(
      title: document["title"],
      ownedBy: document["ownedBy"],
      createdBy: document["createdBy"],
      createdAt: document["createdAt"],
      exercises: List<ExerciseModel>.from(
          List<Map<String, dynamic>>.from(document['exercises'] ?? [])
                  .map((exercise) => ExerciseModel.fromMap(exercise))),
    );
  }
}
