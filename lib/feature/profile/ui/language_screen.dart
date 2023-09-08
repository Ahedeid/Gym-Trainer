import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/profile/ui/profile_screen.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();
    // Load the selected language from shared preferences when the screen initializes.
    selectedLanguage = sl<SharedPrefController>().getLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.changeLanguageApp.tr(), // Translate the title.
        visible: true,
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
                AppStrings.english.tr(), // Translate the language names.
                style: StyleManger.bodyText2(),
              ),
              value: 'en',
              groupValue: selectedLanguage,
              onChanged: (val) {
                setState(() {
                  selectedLanguage = val!;
                });
              },
            ),
            CustomDivider(),
            RadioListTile(
              activeColor: ColorManager.secondary,
              title: Text(
                AppStrings.arabic.tr(), // Translate the language names.
                style: StyleManger.bodyText2(),
              ),
              value: 'ar',
              groupValue: selectedLanguage,
              onChanged: (val) {
                setState(() {
                  selectedLanguage = val!;
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
        child: CustomButtonWidget(
          title: AppStrings.saveChanges.tr(), // Translate the button text.
          onPressed: () {
            // Update the app's locale based on the selected language.
            final newLocale = selectedLanguage == "en"
                ? const Locale("en", "US")
                : const Locale("ar", "AR");
            sl<AppRouter>().navigatorKey.currentContext!.setLocale(newLocale);

            // Save the selected language to shared preferences.
            sl<SharedPrefController>().setLanguage(selectedLanguage);
          },
        ),
      ),
    );
  }
}
