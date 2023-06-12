import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/index.dart';
import 'package:gym_buddy/Shared/Widgets/index.dart';
import 'package:iconsax/iconsax.dart';
import 'editprofile.controller.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('editProfile'.tr),
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppPadding.p24,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: AppPadding.p8,
                        child: Icon(Iconsax.profile_circle, size: 100, color: Theme.of(context).colorScheme.onBackground,) ??
                            const CircleAvatar(
                              backgroundImage:
                              AssetImage('assets/images/male.jpg'),
                              radius: 50,
                            ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          padding: AppPadding.p0,
                          iconSize: 20,
                          onPressed: (){},
                            icon: Icon(Iconsax.gallery_edit, color: Theme.of(context).colorScheme.onBackground)
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                  controller: controller.username,
                  style: AppTypography.h3.copyWith(fontWeight: FontWeight.w600),
                ),
                Spacer(),
                FilledButton(
                    onPressed: (){
                      controller.editUser();
                    },
                    child: Text('save'.tr)
                )
              ]),
        ),
      ),
    );
  }
}
