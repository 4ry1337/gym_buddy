import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Shared/index.dart';
import '../controllers/auth.controller.dart';
import 'Widgets/SignUp.widget.dart';
import 'Widgets/SignIn.widget.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = <Tab>[
      Tab(text: 'signUp'.tr),
      Tab(text: 'signIn'.tr),
    ];
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: Stack(
          children: [
            const TabBarView(
              physics: ScrollPhysics(),
              children: [
                SignUpWidget(),
                SignInWidget(),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.background,
                    Theme.of(context).colorScheme.background.withOpacity(0),
                  ],
                ),
              ),
              child: SafeArea(
                child: TabBar(
                  padding: EdgeInsets.only(right: Get.width/2),
                  indicator: UnderlineTabIndicator(
                    borderRadius: AppBorderRadius.br16,
                    borderSide: BorderSide(width: 2, color: Theme.of(context).colorScheme.primary),
                  ),
                  dividerColor: AppColors.transparent,
                  overlayColor: MaterialStateProperty.all(AppColors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  tabs: tabs,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
