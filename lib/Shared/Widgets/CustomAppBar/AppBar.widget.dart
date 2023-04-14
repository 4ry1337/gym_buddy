import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../index.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.backButton,
    this.actions,
  });

  final bool? backButton;
  final Text title;
  final List<Widget>? actions;

  @override
  build(BuildContext context){
    return AppBar(
      flexibleSpace: Container(
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
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: backButton == null || backButton == false ? null : TextButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Get.back();
        },
      ),
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}