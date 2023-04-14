import 'package:isar/isar.dart';

class User {
  String? id;
  String firstName;
  String lastName;
  String email;
  String password;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJSON() => {
    "firstname": firstName,
    "lastname": lastName,
    "email": email,
    "password": password,
  };
}