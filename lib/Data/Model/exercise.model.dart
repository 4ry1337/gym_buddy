import 'package:cloud_firestore/cloud_firestore.dart';

enum ExerciseType {
  repetition,
  time,
  distance,
  weight,
}

class ExerciseModel {
  String? id;
  String name;
  String? ownedBy;
  String? createdBy;
  ExerciseType exerciseType;
  String? description;
  String? weight;
  int? sets;
  int? reps;
  int? distance;
  int? time;
  int? restTime;

  ExerciseModel({
    this.id,
    required this.name,
    this.description,
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

  toJSON() {
    return {
      "name": name,
      "ownedBy": ownedBy,
      "createdBy": createdBy,
      "exerciseType": exerciseType.name,
      "description": description,
      "weight": weight,
      "sets": sets,
      "reps": reps,
      "distance": distance,
      "time": time,
      "restTime": restTime,
    };
  }

  factory ExerciseModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ExerciseModel(
      id: document.id,
      name: data["name"],
      ownedBy: data["ownedBy"],
      createdBy: data["createdBy"],
      exerciseType: ExerciseType.values.byName(data['exerciseType']),
      description: data["description"],
      weight: data["weight"],
      sets: data["sets"],
      reps: data["reps"],
      distance: data["distance"],
      time: data["time"],
      restTime: data["restTime"],
    );
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> document) {
    return ExerciseModel(
      name: document["name"],
      ownedBy: document["ownedBy"],
      createdBy: document["createdBy"],
      exerciseType: document["exerciseType"],
      description: document["description"],
      weight: document["weight"],
      sets: document["sets"],
      reps: document["reps"],
      distance: document["distance"],
      time: document["time"],
      restTime: document["restTime"],
    );
  }
}