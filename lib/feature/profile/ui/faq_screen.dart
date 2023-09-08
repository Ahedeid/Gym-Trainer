import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/sheared/widget/expanionTileWidget.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.fAQsConditionsAppBar,
        visible: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        children: [
          ExpansionTileWidget(
            title: AppStrings.whatIsThePurpose.tr(),
            text: AppStrings.theGymMobile.tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: AppStrings.howCanIDownload.tr(),
            text: AppStrings.theGymMobile.tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: AppStrings.isTheGymMobile.tr(),
            text: AppStrings.theGymMobile.tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: AppStrings.canIBookFitnessClasses.tr(),
            text: AppStrings.theGymMobile.tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: AppStrings.doesTheGymMobile.tr(),
            text: AppStrings.theGymMobile.tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: AppStrings.canITrackMyFitness.tr(),
            text: AppStrings.theGymMobile.tr(),
          ),
          8.verticalSpace,
        ],
      ),
    );
  }
}
