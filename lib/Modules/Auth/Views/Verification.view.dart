import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/Config/Theme/Spacing.dart';
import 'package:gym_buddy/Shared/Config/Theme/Typography.dart';
import '../controllers/verification.controller.dart';

class VerificationPage extends GetView<VerificationController> {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: AppPadding.p24,
              child: Column(
                children: [
                  Icon(
                    Icons.email,
                  ),
                  const SizedBox(height: AppSpacing.s24),
                  Text(
                    'VerifyEmailTitle'.tr,
                    style: AppTypography.h5,
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  const Text(
                    'We have just send email verification link on you email. Please check email and click on that link to verify you Email address',
                    style: AppTypography.subtitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  const Text(
                    'If not auto redirected after verification, click on the Continue button',
                    style: AppTypography.body,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.s24),
                  OutlinedButton(
                      onPressed: (){
                        controller.manuallyCheckEmailVerificationStatus();
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 70),
                        shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.br24)
                      ),
                      child: Text(
                          'Continue'.tr,
                      )
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  TextButton(
                      onPressed: (){
                        controller.sendVerificationEmail();
                      },
                      child: Text('Resend E-mail Link')
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  TextButton.icon(
                      onPressed: (){
                        controller.toAuth();
                      },
                      icon: Icon(Icons.arrow_back),
                      label: Text('back to login')
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
