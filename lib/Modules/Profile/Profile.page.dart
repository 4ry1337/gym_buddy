import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../Service/index.dart';
import '../../Shared/Widgets/index.dart';
import '../../Shared/index.dart';
import 'profile.controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: Text('profile'.tr),
        backButton: true,
        actions: [
          TextButton(
            onPressed: () {
              controller.toEdiProfilePage();
            },
            child: Text('editProfile'.tr),
          ),
          TextButton(
            onPressed: () {
              controller.toSettingsPage();
            },
            child: Text('settings'.tr),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          minimum: AppPadding.p24,
          child: Column(
            children: [
              Obx(()=>Card(
                child: Container(
                  padding: AppPadding.p16,
                  child: Row(
                    children: [
                      Expanded(
                        child: FittedBox(
                          child: Icon(Iconsax.profile_circle, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),) ??
                              const CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/images/male.jpg'),
                              ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.s8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "@${UserService.instance.currentUser.value.username}",
                            style: AppTypography.h5.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: AppSpacing.s8),
                          Text(
                            UserService.instance.currentUser.value.email,
                            style: AppTypography.subtitle,
                          ),
                          if(UserService.instance.currentUser.value.createdAt != null) ...[
                            const SizedBox(height: AppSpacing.s8),
                            Text(
                              "Joined ${DateFormat('dd MM yyyy').format(UserService.instance.currentUser.value.createdAt!.toDate())}",
                              style: AppTypography.subtitle.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
