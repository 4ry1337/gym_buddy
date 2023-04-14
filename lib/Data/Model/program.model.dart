import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.model.dart';

class ProgramModel {
  String? id;
  String programName;
  DocumentReference createdBy;
  Timestamp? createdAt;
  List<DocumentReference<Map<String, dynamic>>>? workouts;
  ProgramModel({
    this.id,
    required this.programName,
    required this.createdBy,
    this.createdAt,
    this.workouts,
  }){
    workouts = workouts ?? const [];
    createdAt = createdAt ?? Timestamp.now();
  }

  toJSON(){
    return {
      "programName": programName,
      "createdBy": createdBy,
      "createdAt": createdAt,
      "workouts": workouts,
    };
  }

  factory ProgramModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return ProgramModel(
        id: document.id,
        programName: data["programName"],
        createdBy: data["createdBy"],
        createdAt: data["createdAt"],
      workouts: data["workouts"],
    );
  }
}