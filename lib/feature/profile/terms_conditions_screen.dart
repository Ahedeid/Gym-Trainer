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
            AppStrings.weAreCommittedToProtecting,
            style: StyleManger.headline4(color: Colors.grey.shade600),
          ),
          16.addVerticalSpace,
          Text(
            AppStrings.informationWeCollect,
            style: StyleManger.bodyText(fontSize: FontSize.s14),
          ),
          8.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.personalInformationSuchAsYourName,
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.fitnessAndHealthRelated,
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.deviceInformationSuchAsYourDevice,
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.usageInformationIncludingApp,
          ),
          16.addVerticalSpace,
          Text(
            AppStrings.howWeUseYourInformation,
            style: StyleManger.bodyText(fontSize: FontSize.s14),
          ),
          8.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.toProvideAndImproveOurGymMobile,
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.toCommunicateWithYou,
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.toAnalyzeAndMonitor,
          ),
          4.addVerticalSpace,
          CustomDetailsText(
            text: AppStrings.toSendYouMarketing,
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
