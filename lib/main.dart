import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_buddy/Service/theme.service.dart';
import 'Modules/Routes.dart';
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
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "GymBuddy",
          translations: LocalizationService.getInstance(),
          locale: SettingsService.getCurrentLocale(),
          debugShowCheckedModeBanner: false,
          fallbackLocale: LocalizationService.defaultLanguage,
          theme: ThemeService.supportedThemes[SettingsService.getCurrentTheme()]!.themeData,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeService.supportedThemes[SettingsService.getCurrentTheme()]!.themeMode,
          home: Builder(
            builder: (BuildContext context){
              Get.put(AppService());
              return Center(
                child: Text('Gym Buddy', style: AppTypography.h1.copyWith(color: Theme.of(context).colorScheme.primary),),
              );
            },
          ),
          getPages: Routes.routes,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}