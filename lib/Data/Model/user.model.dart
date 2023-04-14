import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.model.dart';

class UserModel {
  String id;
  String username;
  String email;
  String? profilePicture;
  Timestamp? createdAt;
  DocumentReference<Map<String, dynamic>>? currentProgram;
  List<DocumentReference<Map<String, dynamic>>>? programs;
  List<DocumentReference<Map<String, dynamic>>>? exercises;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.profilePicture,
    this.programs,
    this.exercises,
    this.currentProgram,
    this.createdAt,
  }){
    programs = programs ?? const [];
    exercises = exercises ?? const [];
    createdAt = createdAt ?? Timestamp.now();
  }

  toJSON(){
    return {
      "username": username,
      "email": email,
      "profilePicture": profilePicture,
      "createdAt": createdAt,
      "currentProgram": currentProgram,
      "programs": programs,
      "exercises": exercises,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
      id: document.id,
      username: data["username"],
      email: data["email"],
      profilePicture: data["profilePicture"],
      createdAt: data["createdAT"],
      currentProgram: data["currentProgram"],
    );
  }
}