import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/notification/model/notification_model.dart';
import 'package:gym_app/feature/profile/ui/profile_screen.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/service_locator.dart';
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
        visible: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: sl<FirebaseFirestore>()
              .collection(FirebaseConstant.notifications)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingHorizontal,
                  vertical: AppSizes.paddingVertical,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final notificationData =
                      NotificationsModel.fromJson(snapshot.data!.docs[index]);
                  print('in list view');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: MainContainer(
                          height: 44,
                          width: 44,
                          color: ColorManager.secondPrimary,
                          alignment: Alignment.center,
                          child: Text(
                            '👏🏻',
                            style: StyleManger.headline2(),
                          ),
                        ),
                        title: Text(
                          notificationData.title,
                          style: StyleManger.headline3(),
                        ),
                        trailing: Text(
                          notificationData.time,
                          //  timeFormat,
                          style: StyleManger.bodyText2(),
                        ),
                      ),
                      4.addVerticalSpace,
                      Text(
                        notificationData.body,
                        style: StyleManger.headline4(),
                      ),
                      8.addVerticalSpace,
                      CustomDivider(),
                    ],
                  );
                });
          }),
    );
  }
}
