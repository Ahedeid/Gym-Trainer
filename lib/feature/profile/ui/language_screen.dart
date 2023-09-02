import 'package:flutter/material.dart';
import 'package:gym_app/feature/profile/ui/profile_screen.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

enum Language { English, Arabic }

class _LanguageScreenState extends State<LanguageScreen> {
  Language language = Language.English;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.changeLanguageApp,
      ),
      body: MainContainer(
        bottom: AppSizes.paddingVertical,
        top: AppSizes.paddingVertical,
        right: AppSizes.paddingHorizontal,
        left: AppSizes.paddingHorizontal,
        vertical: 8,
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile(
              activeColor: ColorManager.secondary,
              title: Text(
                'English',
                style: StyleManger.bodyText2(),
              ),
              value: Language.English,
              groupValue: language,
              onChanged: (val) {
                setState(() {
                  language = val!;
                });
              },
            ),
            CustomDivider(),
            RadioListTile(
              activeColor: ColorManager.secondary,
              title: Text(
                'Arabic',
                style: StyleManger.bodyText2(),
              ),
              value: Language.Arabic,
              groupValue: language,
              onChanged: (val) {
                setState(() {
                  language = val!;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical,
        ),
        child:
            CustomButtonWidget(title: AppStrings.saveChanges, onPressed: () {}),
      ),
    );
  }
}
