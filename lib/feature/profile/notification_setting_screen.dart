import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/profile/ui/profile_screen.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
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
        title: AppStrings.notificationsAppBar,
        onTap: () {},
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white, // Your desired background color
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 4,
                  offset: const Offset(0, 1)),
            ]),
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

class CustomSwitchListTile extends StatefulWidget {
  CustomSwitchListTile({
    required this.title,
    required this.value,
    super.key,
  });

  late bool value;
  final String title;

  @override
  State<CustomSwitchListTile> createState() => _CustomSwitchListTileState();
}

class _CustomSwitchListTileState extends State<CustomSwitchListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
        });
      },
      title: Text(widget.title),
      trailing: CupertinoSwitch(
        activeColor: ColorManager.primary,
        trackColor: ColorManager.boardingBackGroundColor1,
        value: widget.value,
        onChanged: (val) {
          setState(() {
            widget.value = val;
          });
        },
      ),
    );
  }
}