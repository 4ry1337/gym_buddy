import 'package:get/get.dart';

import 'index.dart';

class Routes {
  Routes._();
  static String auth = '/auth';
  static String home = '/home';
  static String profile = '/profile';
  static String editProfile = '/edit';

  static String start = '/start';
  static String program = '/program';
  static String workout = '/workout';
  static String exercise = '/exercise';

  static String settings = '/settings';
  static String notifications = '/notifications';
  static String units = '/units';
  static String languages = '/languages';
  static String privacyPolicy = '/privacyPolicy';
  static String guide = '/guide';
  static String aboutUs = '/aboutUs';

  static final routes = [
    GetPage(
      name: Routes.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.program,
      page: () => const ProgramPage(),
      binding: ProgramBinding(),
      transition: Transition.fadeIn,
    ),
    //profile
    GetPage(
        name: Routes.profile,
        page: () => const ProfilePage(),
        binding: ProfileBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300),
        children: [
          //edit profile
          GetPage(
            name: Routes.editProfile,
            page: () => const EditProfilePage(),
            binding: EditProfileBinding(),
            transition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 300),
          ),
          GetPage(
              name: Routes.settings,
              page: () => const SettingsPage(),
              binding: SettingsBinding(),
              transition: Transition.rightToLeft,
              transitionDuration: const Duration(milliseconds: 300),
              children: [
                GetPage(
                    name: Routes.languages,
                    page: () => const LanguagesPage(),
                    transition: Transition.fadeIn),
                GetPage(
                    name: Routes.guide,
                    page: () => const GuidePage(),
                    transition: Transition.fadeIn),
                GetPage(
                    name: Routes.notifications,
                    page: () => const NotificationsPage(),
                    transition: Transition.fadeIn),
                GetPage(
                    name: Routes.units,
                    page: () => const UnitsPage(),
                    transition: Transition.fadeIn),
                GetPage(
                  name: Routes.privacyPolicy,
                  page: () => const PrivacyPolicyPage(),
                  transition: Transition.fadeIn,
                ),
                GetPage(
                  name: Routes.aboutUs,
                  page: () => const AboutUsPage(),
                  transition: Transition.fadeIn,
                ),
              ]),
        ]),
  ];
}
