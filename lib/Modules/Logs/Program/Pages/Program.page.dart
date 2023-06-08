import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Shared/Widgets/CustomAppBar/AppBar.widget.dart';

import 'package:gym_buddy/Shared/index.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../controller.dart';

class ProgramPage extends GetView<ProgramController> {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          IconButton(
              onPressed: (){
                controller.toEditProgramPage();
              },
            icon: const Icon(Iconsax.edit),
          ),
        ],
        centerTitle: true,
        leading: const BackButton(),
        title: Text('program'.tr),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: AppPadding.p16h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(()=>Text(
                    controller.program.value.title,
                    style: AppTypography.h5,
                  )),
                  const SizedBox(height: AppSpacing.s8),
                  Obx(()=>Text.rich(
                      TextSpan(
                          text: 'createdBy'.tr,
                          children: [
                            const TextSpan(text: ' '),
                            TextSpan(text: controller.program.value.createdBy,),
                          ]
                      )
                  )),
                  const SizedBox(height: AppSpacing.s8),
                  Obx(()=>Text(
                    DateFormat('dd MM yyyy').format(controller.program.value.createdAt!.toDate()),
                    style: AppTypography.subtitle,
                  )),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.s16),
            Expanded(
              child: Container(
                padding: AppPadding.p16h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'workouts'.tr,
                      style: AppTypography.h4,
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    Expanded(
                      child: controller.program.value.workouts.isEmpty ?
                      const Center(
                          child: Text('no workouts')
                      ) : Obx(()=> ListView.separated(
                        shrinkWrap: true,
                        scrollDirection:  Axis.vertical,
                        itemCount: controller.program.value.workouts.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Card(
                            margin: AppPadding.p0,
                            clipBehavior: Clip.hardEdge,
                            child: ExpansionTile(
                              title: Container(
                                padding: AppPadding.p16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.program.value.workouts[index].title,
                                      style: AppTypography.h5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }, separatorBuilder: (BuildContext context, int index)=>const SizedBox(height: AppSpacing.s8),)
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
