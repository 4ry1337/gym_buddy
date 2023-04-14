import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.model.dart';

class WorkoutModel {
  String? id;
  String workoutTitle;
  DocumentReference? createdBy;
  Timestamp? createdAt;
  List<Map<String, dynamic>>? exercises;
  WorkoutModel({
    this.id,
    required this.createdBy,
    required this.workoutTitle,
    this.exercises,
    this.createdAt,
  }){
    createdAt = createdAt ?? Timestamp.now();
    exercises = exercises ?? const [];
  }

  toJSON(){
    return {
      "workoutTitle": workoutTitle,
      "createdBy": createdBy,
      "createdAt": createdAt,
      "exercises": exercises,
    };
  }

  factory WorkoutModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return WorkoutModel(
      id: document.id,
      workoutTitle: data["workoutTitle"],
      createdBy: data["createdBy"],
      createdAt: data["createdAt"],
      exercises: data["exercises"],
    );
  }
}