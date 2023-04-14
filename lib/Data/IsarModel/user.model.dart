/*
import 'dart:typed_data';
import 'package:isar/isar.dart';

import 'index.dart';

part 'user.model.g.dart';

@collection
class User {
  Id id;
  String userName;
  List<int>? profilePicture;
  String? firstName;
  String? lastName;

  final plans = IsarLinks<Plan>();

  User({
    this.id = Isar.autoIncrement,
    required this.userName,
    this.profilePicture,
    this.firstName,
    this.lastName,
  });

  Map<String, dynamic> toJSON() => {
    "username": userName,
    "firstname": firstName,
    "lastname": lastName,
    "profilePicture": profilePicture,
  };
}*/
