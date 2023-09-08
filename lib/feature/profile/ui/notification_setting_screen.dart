import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/profile/ui/profile_screen.dart';
import 'package:gym_app/feature/profile/ui/widget/custom_switch_listtile.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/service_locator.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    memberShip = sl<SharedPrefController>().getMembershipStatus();
    classesNewUpdates = sl<SharedPrefController>().getClassesNewUpdates();
    contentNewArticles = sl<SharedPrefController>().getContentNewArticles();
    workoutUpdates = sl<SharedPrefController>().getWorkoutUpdates();
    storeNewProducts = sl<SharedPrefController>().getStoreNewProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.notificationsSettingAppBar,
        visible: true,
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
              setValue: sl<SharedPrefController>().setMembershipStatus,
              value: memberShip,
              title: AppStrings.membershipStatusAndOffers.tr(),
            ),
            CustomDivider(),
            CustomSwitchListTile(
              setValue: sl<SharedPrefController>().setClassesNewUpdates,
              value: classesNewUpdates,
              title: AppStrings.classesNewUpdates.tr(),
            ),
            CustomDivider(),
            CustomSwitchListTile(
              setValue: sl<SharedPrefController>().setContentNewArticles,
              value: contentNewArticles,
              title: AppStrings.contentNewArticles.tr(),
            ),
            CustomDivider(),
            CustomSwitchListTile(
              setValue: sl<SharedPrefController>().setWorkoutUpdates,
              value: workoutUpdates,
              title: AppStrings.workoutUpdates.tr(),
            ),
            CustomDivider(),
            CustomSwitchListTile(
              setValue: sl<SharedPrefController>().setStoreNewProducts,
              value: storeNewProducts,
              title: AppStrings.storeNewProducts.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
