import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Modules/Auth/widgets/SignIn.widget.dart';

import '../../Shared/index.dart';
import 'controller.dart';
import 'Widgets/SignUp.widget.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = <Tab>[
      Tab(text: 'signUp'.tr),
      Tab(text: 'signIn'.tr),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.accent,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.background,
                    Theme.of(context).colorScheme.background.withOpacity(0),
                  ],
                ),
              ),
              child: TabBar(
                padding: EdgeInsets.only(right: Get.width/2),
                indicator: UnderlineTabIndicator(
                  borderRadius: AppBorderRadius.br16,
                  borderSide: BorderSide(
                      width: 2, color: Theme.of(context).colorScheme.primary),
                ),
                dividerColor: AppColors.transparent,
                overlayColor: MaterialStateProperty.all(AppColors.transparent),
                splashFactory: NoSplash.splashFactory,
                tabs: tabs,
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            SignUpWidget(),
            SignInWidget(),
          ],
        ),
      ),
    );
  }
}
