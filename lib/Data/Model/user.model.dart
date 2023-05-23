import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String username;
  String email;
  String? profilePicture;
  Timestamp? createdAt;
  String? currentProgram;
  List<String> programs;
  List<String> exercises;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.profilePicture,
    required this.programs,
    required this.exercises,
    this.currentProgram,
    this.createdAt,
  }) {
    createdAt = createdAt ?? Timestamp.now();
  }

  toJSON() {
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

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      username: data["username"],
      email: data["email"],
      profilePicture: data["profilePicture"],
      createdAt: data["createdAT"],
      currentProgram: data["currentProgram"],
      programs: List<String>.from(data["programs"] ?? []),
      exercises: List<String>.from(data["exercises"] ?? []),
    );
  }
}
