import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_buddy/Shared/index.dart';

enum ExerciseType {
  repetition,
  time,
  distance,
  weight,
}

class ExerciseModel {
  String? id;
  String title;
  String? ownedBy;
  String? createdBy;
  ExerciseType exerciseType;
  String? weight;
  int? sets;
  int? reps;
  double? distance;
  Duration? time;
  Duration? restTime;

  ExerciseModel({
    this.id,
    required this.title,
    this.ownedBy,
    this.createdBy,
    required this.exerciseType,
    this.weight,
    this.sets,
    this.reps,
    this.distance,
    this.time,
    this.restTime,
  });

  Map<String, dynamic> toJSON() {
    return {
      "title": title,
      "ownedBy": ownedBy,
      "createdBy": createdBy,
      "exerciseType": exerciseType.name,
      "weight": weight,
      "sets": sets,
      "reps": reps,
      "distance": distance,
      "time": time.toString(),
      "restTime": restTime.toString(),
    };
  }

  factory ExerciseModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ExerciseModel(
      id: document.id,
      title: data["title"],
      ownedBy: data["ownedBy"],
      createdBy: data["createdBy"],
      exerciseType: ExerciseType.values.byName( data['exerciseType']),
      weight: data["weight"],
      sets: data["sets"],
      reps: data["reps"],
      distance: data["distance"],
      time: parseDuration(data["time"]),
      restTime: parseDuration(data["restTime"]),
    );
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> document) {
    return ExerciseModel(
      title: document["title"],
      ownedBy: document["ownedBy"],
      createdBy: document["createdBy"],
      exerciseType: ExerciseType.values.byName(document["exerciseType"]),
      weight: document["weight"],
      sets: document["sets"],
      reps: document["reps"],
      distance: document["distance"],
      time: parseDuration(document["time"]),
      restTime: parseDuration(document["restTime"]),
    );
  }
}