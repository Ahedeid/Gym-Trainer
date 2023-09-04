import 'package:flutter/material.dart';
import 'package:gym_app/feature/profile/ui/profile_screen.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String timeFormat = DateFormat("hh:mm a").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.notificationsAppBar,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index)=>Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: MainContainer(
                height: 44,
                width: 44,
                color: ColorManager.secondPrimary,
                alignment: Alignment.center,
                child: Text('👏🏻',style: StyleManger.headline2(),),
              ),
              title: Text('Your membership has expired!',style: StyleManger.headline3(),),
              trailing: Text(timeFormat,style: StyleManger.bodyText2(),),
            ),
            8.addVerticalSpace,
            Text('Please renew to continue enjoying our services.',style: StyleManger.headline4(),),
            16.addVerticalSpace,
            CustomDivider(),
          ],
        ),
       
      ),
    );
  }
}
