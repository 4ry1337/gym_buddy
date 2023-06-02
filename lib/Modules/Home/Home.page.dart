import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Service/index.dart';
import 'package:gym_buddy/Shared/index.dart';
import 'package:iconsax/iconsax.dart';

import '../../Shared/Widgets/index.dart';
import 'Widgets/HeroSection.widget.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: Text.rich(
            TextSpan(
                text: 'hello'.tr,
                children: AppService.instance.user.value.username != null ? [
                  const TextSpan(text: ', '),
                  TextSpan(text: AppService.instance.user.value.username),
                ] : []
            )
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.toProfilePage();
            },
            icon: const Icon(Iconsax.profile_circle) ??
                CircleAvatar(
                    backgroundImage: AssetImage('assets/images/male.jpg')
                ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding: AppPadding.p16h,
                  child: HeroSection(
                    workoutTitle: AppService.instance.user.value.currentProgramId,
                  )
              ),
              Container(
                padding: AppPadding.p16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('programs'.tr, style: AppTypography.subtitle),
                    IconButton(
                        onPressed: (){
                          controller.toAddProgramPage();
                        },
                        icon: Icon(Iconsax.add)
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: AppSpacing.s16),
                      Obx(()=> ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: AppService.instance.programs.value.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: AppPadding.p0,
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  onTap: () {
                                    controller.toProgramPage(AppService.instance.programs.value[index]);
                                  },
                                  child: Container(
                                      width: 200,
                                      padding: AppPadding.p8,
                                      child: Center(child: Text(AppService.instance.programs.value[index].title))),
                                ),
                              );
                            }, separatorBuilder: (BuildContext context, int index) => const SizedBox(width: AppSpacing.s8)
                      )),
                      const SizedBox(width: AppSpacing.s16),
                    ],
                  ),
                ),
              ),
              Container(
                padding: AppPadding.p16,
                child: Text('history'.tr, style: AppTypography.subtitle),
              ),
              Flexible(
                  child: Container(
                      padding: AppPadding.p16h,
                      child: Calendar()
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
