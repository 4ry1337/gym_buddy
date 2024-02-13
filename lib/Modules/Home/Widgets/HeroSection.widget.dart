import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/index.dart';
import 'package:iconsax/iconsax.dart';
import 'package:slide_action/slide_action.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    this.workoutTitle,
    required this.set,
  });
  final String? workoutTitle;
  final Function() set;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        cardColor: Theme.of(context).colorScheme.primary,
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.br24),
        ),
      ),
      child: Card(
        margin: AppPadding.p0,
        child: Column(
          children: [
            Padding(
              padding: AppPadding.p24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                          style: AppTypography.h1.copyWith(
                              fontWeight: FontWeight.w600),
                        ),
                      ] : [
                        Text(
                          'noSelectedProgram'.tr,
                          style: AppTypography.h1.copyWith(
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppPadding.p24,
              child: SlideAction(
                thumbWidth: 150,
                trackBuilder: (context, state) {
                  return Container();
                },
                thumbBuilder: (BuildContext context, SlideActionStateMixin currentState) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: AppBorderRadius.br24,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'start'.tr,
                          style: AppTypography.h1.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: AppSpacing.s8),
                        const Icon(Iconsax.arrow_right_3, size: 40),
                      ],
                    ),
                  );
                },
                action: () {
                  set();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
