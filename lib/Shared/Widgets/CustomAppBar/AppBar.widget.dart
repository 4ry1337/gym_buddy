import 'package:flutter/material.dart';

import '../../index.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle,
  });

  final bool? centerTitle;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  build(BuildContext context){
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: AppColors.darkAccent,
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
      centerTitle: centerTitle,
      elevation: 0,
      leading: leading,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}