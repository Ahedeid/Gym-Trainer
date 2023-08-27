import 'package:flutter/material.dart';
import 'package:gym_app/feature/home_screen/ui/widget/custom_grid_view.dart';
import 'package:gym_app/feature/home_screen/ui/widget/custom_grid_view_static.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/images_constant.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List iconsGrid = [
    AppIcons.today,
    AppIcons.scan,
    AppIcons.myWorkOut,
    AppIcons.classes,
  ];
  List titleGrid = [
    AppStrings.seaToday,
    AppStrings.dailyAttendance,
    AppStrings.myWorkouts,
    AppStrings.classes,
  ];
  List subTitleGrid = [
    AppStrings.shouldersLegs,
    AppStrings.daysStraight,
    AppStrings.daysCompleted,
    AppStrings.activeClasses,
  ];

  List titleButton = [
    AppStrings.letsDoIt,
    AppStrings.attendNow,
    AppStrings.Continue,
    AppStrings.discover,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Hi Ahed! 👋🏻',
        subTitle: 'Let’s check your activity ..',
        onTap: () {},
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        children: [
          CustomGridViewStatic(
            iconsGrid: iconsGrid,
            titleGrid: titleGrid,
            subTitleGrid: subTitleGrid,
            titleButton: titleButton,
          ),
          const SizedBox(height: 18),
          Text(AppStrings.dalyWorkOut, style: StyleManger.headline1()),
          const SizedBox(height: 10),
          CustomGridView(
            image: ImageApp.imageHome,
            title: AppStrings.mountainClimbers,
            subTitle: 'Rounds: 10',
            text: 'Repeats: 10, 8, 8',
            fontWeightToText: FontWeight.w500,
          ),
          const SizedBox(height: 18),
          Text(AppStrings.discoverNewWorkouts, style: StyleManger.headline1()),
          const SizedBox(height: 10),
          CustomGridView(
            image: ImageApp.imageHomes,
            title: 'Cardio',
            subTitle: '🏃🏻‍♂️ 10 Exercises',
            text: '⌛️ 50 Minutes',
          ),
          const SizedBox(height: 16),
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 15),
                  MainContainer(
                    height: 236,
                    horizontal: AppSizes.paddingContainer,
                    vertical: AppSizes.paddingContainer,
                    child: Column(
                      children: [
                        const Spacer(
                          flex: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.months,
                              style: StyleManger.headline2(
                                  color: ColorManager.white),
                            ),
                            Text(
                              '\$99,99',
                              style: StyleManger.headline2(
                                  color: ColorManager.white),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.check, color: ColorManager.white),
                            const SizedBox(width: 8),
                            Text(
                              'Point Number 1',
                              style: StyleManger.headline4(
                                  color: ColorManager.white),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.check, color: ColorManager.white),
                            const SizedBox(width: 8),
                            Text(
                              'Point Number 2',
                              style: StyleManger.headline4(
                                  color: ColorManager.white),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        CustomButtonWidget(
                          title: AppStrings.moreDetails,
                          onPressed: () {},
                          textColor: ColorManager.primary,
                          fontWeight: FontWeight.w700,
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style
                              ?.copyWith(
                                maximumSize: const MaterialStatePropertyAll(
                                    Size(double.infinity, 50)),
                                backgroundColor: const MaterialStatePropertyAll(
                                    ColorManager.backGroundButtonSecondary),
                              ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: MainContainer(
                    width: 153,
                    height: 35,
                    alignment: Alignment.center,
                    color: ColorManager.orange,
                    child: Text(
                      AppStrings.daysStraight,
                      style: StyleManger.bodyText(),
                    )),
              )
            ],
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
