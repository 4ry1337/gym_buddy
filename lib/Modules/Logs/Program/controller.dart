import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';
import 'package:gym_buddy/Service/index.dart';

import '../../Routes.dart';

class ProgramController extends GetxController {
  static ProgramController get instance => Get.find();
  toProfilePage() => Get.toNamed(Routes.program);

  final programTitle = TextEditingController();

  /*Future<void> addWorkout() async{
    workouts.add(
        WorkoutModel(
            ownerId: UserService.instance.userData.id,
            name: '',
        )
    );
  }*/
}