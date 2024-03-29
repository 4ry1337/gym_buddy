import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/index.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/auth.controller.dart';


class SignInWidget extends GetView<AuthController>{
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.br24,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/male.jpg'),
                    fit: BoxFit.cover,
                  )
              ),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: AppPadding.p24,
                child: Text('signInText'.tr, style: AppTypography.h2),
              )
          ),
        ),
        Padding(
          padding: AppPadding.p24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        label: Text('email'.tr),
                        hintText: 'exampleEmail'.tr,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s16),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'password'.tr,
                      ),
                      controller: controller.password,
                      obscureText: true,
                    ),
                    const SizedBox(height: AppSpacing.s16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: (){},
                          child: Text('forgotPassword'.tr, style: AppTypography.footnote)
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.s16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.apple,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.s8),
                  IconButton(
                      onPressed: () {
                        controller.signInWithGoogle();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        size: 24,
                      )),
                  const Spacer(),
                  OutlinedButton(
                      onPressed: () {
                        controller.signInAnonymously();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'skip'.tr,
                            style: AppTypography.subtitle
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                  ),
                  const SizedBox(width: AppSpacing.s8),
                  FilledButton(
                      onPressed: () {
                        controller.signIn(controller.email.text.trim(), controller.password.text.trim());
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'signIn'.tr,
                            style: AppTypography.subtitle.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: AppSpacing.s8),
                          const Icon(Iconsax.arrow_right_3)
                        ],
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}