import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        visible: true,
        title: "termsConditionsAppBar".tr(),
        onTap: () {},
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        children: [
          Text(
            "weAreCommittedToProtecting".tr(),
            style: StyleManger.headline4(color: Colors.grey.shade600),
          ),
          16.addVerticalSpace,
          Text(
            "informationWeCollect".tr(),
            style: StyleManger.bodyText(fontSize: FontSize.s14),
          ),
          8.addVerticalSpace,
          CustomDetailsText(
            text: "personalInformationSuchAsYourName".tr(),
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: "fitnessAndHealthRelated".tr(),
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: "deviceInformationSuchAsYourDevice".tr(),
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: "usageInformationIncludingApp".tr(),
          ),
          16.addVerticalSpace,
          Text(
            "howWeUseYourInformation".tr(),
            style: StyleManger.bodyText(fontSize: FontSize.s14),
          ),
          8.addVerticalSpace,
          CustomDetailsText(
            text: "toProvideAndImproveOurGymMobile".tr(),
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: "toCommunicateWithYou".tr(),
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: "toAnalyzeAndMonitor".tr(),
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: "toSendYouMarketing".tr(),
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
