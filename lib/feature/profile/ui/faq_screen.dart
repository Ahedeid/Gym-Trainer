import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/sheared/widget/expanionTileWidget.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart' as string;

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: string.fAQsConditionsAppBar.tr(),
        visible: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        children: [
          ExpansionTileWidget(
            title: string.whatIsThePurpose.tr(),
            text: string.theGymMobile.tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: string.howCanIDownload.tr(),
            text: string.theGymMobile.tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: string.isTheGymMobile.tr(),
            text: string.theGymMobile.tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: string.canIBookFitnessClasses.tr(),
            text: string.theGymMobile.tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: string.doesTheGymMobile.tr(),
            text: string.theGymMobile.tr(),
          ),
          8.verticalSpace,
          ExpansionTileWidget(
            title: string.canITrackMyFitness.tr(),
            text: string.theGymMobile.tr(),
          ),
          8.verticalSpace,
        ],
      ),
    );
  }
}
