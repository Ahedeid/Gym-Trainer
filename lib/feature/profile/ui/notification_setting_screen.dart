import 'package:flutter/material.dart';
import 'package:gym_app/feature/profile/ui/profile_screen.dart';
import 'package:gym_app/feature/profile/ui/widget/custom_switch_listtile.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool memberShip = false;
  bool classesNewUpdates = false;
  bool contentNewArticles = false;
  bool workoutUpdates = false;
  bool storeNewProducts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.notificationsSettingAppBar,
        onTap: () {},
      ),
      body: MainContainer(
        bottom: AppSizes.paddingVertical,
        top: AppSizes.paddingVertical,
        right: AppSizes.paddingHorizontal,
        left: AppSizes.paddingHorizontal,
        vertical: 8,
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomSwitchListTile(
              value: memberShip,
              title: AppStrings.membershipStatusAndOffers,
            ),
            CustomDivider(),
            CustomSwitchListTile(
              value: classesNewUpdates,
              title: AppStrings.classesNewUpdates,
            ),
            CustomDivider(),
            CustomSwitchListTile(
              value: contentNewArticles,
              title: AppStrings.contentNewArticles,
            ),
            CustomDivider(),
            CustomSwitchListTile(
              value: workoutUpdates,
              title: AppStrings.workoutUpdates,
            ),
            CustomDivider(),
            CustomSwitchListTile(
              value: storeNewProducts,
              title: AppStrings.storeNewProducts,
            ),
          ],
        ),
      ),
    );
  }
}
