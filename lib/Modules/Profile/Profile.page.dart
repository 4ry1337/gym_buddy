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
        leading: const BackButton(),
        actions: [
          IconButton(
            onPressed: () {
              controller.toEdiProfilePage();
            },
            icon: Icon(Iconsax.edit),
          ),
          IconButton(
            onPressed: () {
              controller.toSettingsPage();
            },
            icon: Icon(Iconsax.setting),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Obx(()=>Container(
                padding: AppPadding.p16h + AppPadding.p0v,
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: FittedBox(
                        child: Icon(Iconsax.profile_circle, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)) ??
                            const CircleAvatar(
                              backgroundImage:
                              AssetImage('assets/images/male.jpg'),
                            ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppService.instance.user.value.username ?? 'guest'.tr,
                            style: AppTypography.h3.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            AppService.instance.user.value.email ?? 'link with google or appleid',
                            style: AppTypography.subtitle,
                          ),
                          if(AppService.instance.user.value.createdAt != null) ...[
                            const SizedBox(height: AppSpacing.s8),
                            Text(
                              "Joined ${DateFormat('dd MM yyyy').format(AppService.instance.user.value.createdAt!.toDate())}",
                              style: AppTypography.subtitle.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
