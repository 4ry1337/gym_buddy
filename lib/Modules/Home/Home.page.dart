import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_buddy/Data/Model/index.model.dart';
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
        title: const Text("Hello, Rakhat"),
        actions: [
          TextButton(
            onPressed: () {
              controller.toProfilePage();
            },
            child: const Icon(Iconsax.profile_circle) ??
                CircleAvatar(
                    backgroundImage: AssetImage('assets/images/male.jpg')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(padding: AppPadding.p16h, child: HeroSection()),
              Column(
                children: [
                  Padding(
                    padding: AppPadding.p16h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: AppPadding.p16,
                          child: Text('programs'.tr,
                              style: AppTypography.subtitle),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.toProgramPage();
                          },
                          child: const Icon(Iconsax.add),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: AppPadding.p16h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          StreamBuilder(
                            stream: controller.getPrograms(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final List<ProgramModel> programs = snapshot.data!;
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: programs.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: InkWell(
                                          customBorder: Theme.of(context)
                                              .cardTheme
                                              .shape,
                                          onTap: () {
                                            debugPrint(programs[index].id);
                                          },
                                          child: Container(
                                              width: 200,
                                              padding: AppPadding.p8,
                                              child: Center(
                                                child: Text(programs[index].programName),
                                              )),
                                        ),
                                      );
                                    });
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                          Card(
                            child: InkWell(
                              customBorder: Theme.of(context).cardTheme.shape,
                              onTap: () {
                                debugPrint('new program');
                              },
                              child: Container(
                                  width: 200,
                                  padding: AppPadding.p8,
                                  child: Center(
                                    child: Text('addProgram'.tr),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s16),
              Flexible(
                  child: Padding(padding: AppPadding.p16h, child: Calendar())),
            ],
          ),
        ),
      ),
    );
  }
}
