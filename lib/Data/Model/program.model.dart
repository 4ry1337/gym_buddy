import 'package:cloud_firestore/cloud_firestore.dart';

class ProgramModel {
  String? id;
  String programName;
  String createdBy;
  Timestamp? createdAt;
  List<String> workouts;
  ProgramModel({
    this.id,
    required this.programName,
    required this.createdBy,
    this.createdAt,
    required this.workouts,
  }){
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
      workouts: List<String>.from(data["workouts"] ?? []),
    );
  }
}