import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/index.dart';
import 'package:iconsax/iconsax.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    this.workoutTitle
  });
  final String? workoutTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      dragStartBehavior: DragStartBehavior.start,
      onVerticalDragEnd: (DragEndDetails details){
        print('start');
      },
      child: Theme(
        data: ThemeData(
          cardColor: Theme.of(context).colorScheme.primary,
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.br24),
          ),
        ),
        child: Card(
          margin: AppPadding.p0,
          child: Container(
            height: 150,
            padding: AppPadding.p16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: workoutTitle != null ? [
                      Text(
                        'today'.tr, style: AppTypography.subtitle,
                      ),
                      Text(
                        workoutTitle!,
                        style: AppTypography.h1.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ] : [
                      Text(
                        'noSelectedProgram'.tr,
                        style: AppTypography.h1.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const Icon(Iconsax.arrow_right_3, size: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
