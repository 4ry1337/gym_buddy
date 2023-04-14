import 'package:get/get.dart';

class CalendarController extends GetxController {
  static CalendarController get to => Get.find();

  late Rx<DateTime> selectedDay;

  @override
  void onInit() async {
    selectedDay = DateTime.now().obs;
    super.onInit();
  }

  onDaySelected(DateTime selected){
    selectedDay.value = selected;
  }
}