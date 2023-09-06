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
            title: AppStrings.whatIsThePurpose,
            text: AppStrings.theGymMobile,
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: AppStrings.howCanIDownload,
            text: AppStrings.theGymMobile,
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: AppStrings.isTheGymMobile,
            text: AppStrings.theGymMobile,
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: AppStrings.canIBookFitnessClasses,
            text: AppStrings.theGymMobile,
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: AppStrings.doesTheGymMobile,
            text: AppStrings.theGymMobile,
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: AppStrings.canITrackMyFitness,
            text: AppStrings.theGymMobile,
          ),
          8.verticalSpace,
        ],
      ),
    );
  }
}
