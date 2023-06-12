import 'package:get/get.dart';

import 'index.dart';

class Routes {
  Routes._();
  static String auth = '/auth';
  static String verify = '/verify';
  static String home = '/home';
  static String edit = '/edit';

  static String start = '/start';
  static String profile = '/profile';
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
  static String themes = '/themes';

  static final routes = [
    GetPage(
      name: Routes.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
      children: [
        GetPage(
          name: Routes.verify,
          page: () => const VerificationPage(),
          binding: VerificationBinding(),
          transition: Transition.fadeIn,
        ),
      ]
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
      children: [
        GetPage(
            name: Routes.workout,
            page: () => const WorkoutPage(),
          binding: WorkoutBinding()
        ),
        GetPage(
          name: Routes.edit,
          page: () => const EditProgramPage(),
          binding: ProgramBinding(),
          transition: Transition.rightToLeft,
          children: [
            GetPage(
                name: Routes.workout,
                page: () => const EditWorkoutPage(),
                binding: WorkoutBinding(),
              transition: Transition.fadeIn,
              children: [
                GetPage(
                    name: Routes.exercise,
                    page: () => const AddExercise(),
                  transition: Transition.fadeIn,
                )
              ]
            ),
          ]
        ),
      ]
    ),
    //profile
    GetPage(
        name: Routes.profile,
        page: () => const ProfilePage(),
        binding: ProfileBinding(),
        transition: Transition.rightToLeft,
        children: [
          //edit profile
          GetPage(
            name: Routes.edit,
            page: () => const EditProfilePage(),
            binding: EditProfileBinding(),
            transition: Transition.rightToLeft,
          ),
          GetPage(
              name: Routes.settings,
              page: () => const SettingsPage(),
              binding: SettingsBinding(),
              transition: Transition.rightToLeft,
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
                GetPage(
                  name: Routes.themes,
                  page: () => const ThemesPage(),
                  transition: Transition.fadeIn,
                ),
              ]),
        ]),
  ];
}
