import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/sheared/widget/expanionTileWidget.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "fAQsConditionsAppBar".tr(),
        visible: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        children: [
          ExpansionTileWidget(
            title: "whatIsThePurpose".tr(),
            text: "theGymMobile".tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: "howCanIDownload".tr(),
            text: "theGymMobile".tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: "isTheGymMobile".tr(),
            text: "theGymMobile".tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: "canIBookFitnessClasses".tr(),
            text: "theGymMobile".tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: "doesTheGymMobile".tr(),
            text: "theGymMobile".tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: "canITrackMyFitness".tr(),
            text: "theGymMobile".tr(),
          ),
          8.verticalSpace,
        ],
      ),
    );
  }
}
