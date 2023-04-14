import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Repository/Model/plan.model.dart';
import 'package:gym_buddy/Repository/Model/routine.model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'Pages/Main.page.dart';
import 'Repository/settings.dart';
import 'Service/settings.service.dart';
import 'Shared/Utils/Translation/translation.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
late Isar isar;
late Settings settings;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await isarInit();
  runApp(const App());
}

Future<void> isarInit() async {
  isar = await Isar.open([
    PlanSchema,
    RoutineSchema,
  ], directory: (await getApplicationSupportDirectory()).path);

  settings = await isar.settings.where().findFirst() ?? Settings();
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final localizationService = LocalizationService();
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: Translation(),
          locale: Locale(Translation.languages[settings.language].languageCode, Translation.languages[settings.language].countryCode),
          fallbackLocale: localizationService.fallbackLocale,
          debugShowCheckedModeBanner: false,
          home: const MainPage(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}