import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Shared/index.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      dragStartBehavior: DragStartBehavior.start,
      onVerticalDragEnd: (DragEndDetails details){
        print('start');
      },
      child: Theme(
        data: ThemeData(
          cardTheme: Theme.of(context).cardTheme,
          cardColor: Theme.of(context).colorScheme.primary,
        ),
        child: Card(
          child: Container(
            padding: AppPadding.p16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Today', style: AppTypography.subtitle,
                    ),
                    Text(
                      'Leg Day', style: AppTypography.h1.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
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
