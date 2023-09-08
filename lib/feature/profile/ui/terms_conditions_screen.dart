import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        visible: true,
        title: AppStrings.termsConditionsAppBar,
        onTap: () {},
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        children: [
          Text(
            AppStrings.weAreCommittedToProtecting.tr(),
            style: StyleManger.headline4(color: Colors.grey.shade600),
          ),
          16.addVerticalSpace,
          Text(
            AppStrings.informationWeCollect.tr(),
            style: StyleManger.bodyText(fontSize: FontSize.s14),
          ),
          8.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.personalInformationSuchAsYourName.tr(),
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.fitnessAndHealthRelated.tr(),
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.deviceInformationSuchAsYourDevice.tr(),
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.usageInformationIncludingApp.tr(),
          ),
          16.addVerticalSpace,
          Text(
            AppStrings.howWeUseYourInformation.tr(),
            style: StyleManger.bodyText(fontSize: FontSize.s14),
          ),
          8.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.toProvideAndImproveOurGymMobile.tr(),
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.toCommunicateWithYou.tr(),
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.toAnalyzeAndMonitor.tr(),
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.toSendYouMarketing.tr(),
          ),
        ],
      ),
    );
  }
}

class CustomDetailsText extends StatelessWidget {
  const CustomDetailsText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 5,
          width: 5,
          margin: EdgeInsets.only(top: 8, left: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.black,
          ),
        ),
        4.addHorizontalSpace,
        Expanded(
          child: Text(
            text,
            style: StyleManger.headline4(color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }
}
