import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/images_constant.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class ComingSoonScreen extends StatelessWidget {
  final bool isMemberShipScreen;
  ComingSoonScreen({this.isMemberShipScreen = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: isMemberShipScreen ? memberShipPlan.tr() : myPaymentMethods.tr(),
        visible: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageApp.logo,
              color: ColorManager.black,
              width: 200,
              height: 200,
            ),
            16.addVerticalSpace,
            Text(
              comingSoon.tr(),
              style: StyleManger.headline1(fontSize: FontSize.s30),
            ),
            8.addVerticalSpace,
            Text(
              thisFeatureIsPlan.tr(),
              style: StyleManger.bodyText2(),
            ),
          ],
        ),
      ),
    );
  }
}
