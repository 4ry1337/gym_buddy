import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String? username;
  String? email;
  String? profilePicture;
  Timestamp? createdAt;
  String? currentProgramId;

  UserModel({
    required this.id,
    this.profilePicture,
    this.username,
    this.email,
    this.currentProgramId,
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
      "currentProgram": currentProgramId,
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
      currentProgramId: data["currentProgram"],
    );
  }
}
