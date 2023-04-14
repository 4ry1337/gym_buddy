import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Modules/Routes.dart';
import 'Modules/index.dart';
import 'Service/index.dart';
import 'Shared/index.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SettingsService.init();
  initializeDateFormatting().then((_) => runApp(const App()));
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "GymBuddy",
          translations: LocalizationService.getInstance(),
          locale: SettingsService.getCurrentLocale(),
          fallbackLocale: LocalizationService.defaultLanguage,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme ,
          home: Main(),
          getPages: Routes.routes,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppService());
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
