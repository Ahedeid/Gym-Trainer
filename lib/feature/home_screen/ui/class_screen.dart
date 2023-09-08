import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/card_class_screen.dart';
import 'package:gym_app/sheared/widget/custom_appBar-secondary.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/images_constant.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBarSecondary(
          title: AppStrings.classesAppBar,
          subTitle: AppStrings.buildYourBodySmartly,
          bottom: TabBar(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingHorizontal),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 3),
            dividerColor: ColorManager.white,
            splashBorderRadius: BorderRadius.circular(8),
            labelColor: ColorManager.white,
            indicator: BoxDecoration(
              color: ColorManager.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            tabs: [
              Tab(height: 54, text: AppStrings.all.tr()),
              Tab(height: 54, text: AppStrings.active.tr()),
              Tab(height: 54, text: AppStrings.history.tr()),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TabBarAll(),
            TabBarAll(),
            TabBarAll(),
          ],
        ),
      ),
    );
  }
}

class TabBarAll extends StatefulWidget {
  const TabBarAll({super.key});

  @override
  State<TabBarAll> createState() => _TabBarAllState();
}

class _TabBarAllState extends State<TabBarAll> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingHorizontal,
        vertical: AppSizes.paddingVertical,
      ),
      children: [
        CardClassScreen(
          image: ImageApp.articleImage,
          typeTraining: AppStrings.mindBody,
          praise: AppStrings.free,
          title: AppStrings.bodyBalance.tr(),
          iconLevel: AppIcons.level,
          level: AppStrings.hard,
          clock: '15 mins',
        ),
        CardClassScreen(
          image: ImageApp.articleImage2,
          title: AppStrings.adultSelfDefence.tr(),
          typeTraining: AppStrings.circuits,
          praise: '\$30',
          iconLevel: AppIcons.level,
          level: 'LOW',
          clock: '45 mins',
        ),
      ],
    );
  }
}
