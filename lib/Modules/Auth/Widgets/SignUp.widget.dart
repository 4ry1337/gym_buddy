import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Shared/index.dart';
import '../controller.dart';

class SignUpWidget extends GetView<AuthController> {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Column(
      mainAxisSize: MainAxisSize.max,
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
                child: Text('signUpText'.tr, style: AppTypography.h2),
              )
          ),
        ),
        Padding(
          padding: AppPadding.p24,
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('username'.tr),
                        hintText: 'exampleUsername'.tr,
                      ),
                      controller: controller.username,
                    ),
                    const SizedBox(height: AppSpacing.s16),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('email'.tr),
                        hintText: 'exampleEmail'.tr,
                      ),
                      controller: controller.email,
                    ),
                    const SizedBox(height: AppSpacing.s16),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('password'.tr,),
                      ),
                      controller: controller.password,
                      obscureText: true,
                    ),
                    const SizedBox(height: AppSpacing.s16),
                    TextFormField(
                      //controller: controller.password,
                      decoration: InputDecoration(
                        label: Text('repeatPassword'.tr),
                      ),
                      controller: controller.repeatPassowrd,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.s24),
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
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        size: 24,
                      )),
                  const Spacer(),
                  OutlinedButton(
                      onPressed: () {

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
                        controller.signUp(controller.username.text.trim(), controller.email.text.trim(), controller.password.text.trim(), controller.repeatPassowrd.text.trim());
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'signUp'.tr,
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
