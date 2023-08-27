import 'package:flutter/material.dart';
import 'package:gym_app/service_locator.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({Key? key}) : super(key: key);

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Open Mail App"),
          content: const Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Container(
              height: 38,
              width: 56,
              decoration: BoxDecoration(
                  color: ColorManager.black,
                  borderRadius: BorderRadius.circular(8)),
              child: CustomSvgAssets(
                path: AppIcons.verify,
                width: 46,
                height: 44,
                color: ColorManager.white,
              ),
            ),
            const SizedBox(height: 11),
            const Text(
              AppStrings.checkYourMail,
              style: TextStyle(
                fontSize: FontSize.s22,
                fontWeight: FontWeight.w700,
                color: ColorManager.primaryTextColor,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'We have sent a password recover instructions to your email.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSize.s15,
                color: ColorManager.secondaryTextColor,
              ),
            ),
            const SizedBox(height: 24),
            CustomButtonWidget(
              title: AppStrings.openEmail,
              onPressed: () async {
                OpenMailApp.getMailApps();
                var result = await OpenMailApp.openMailApp(
                  nativePickerTitle: 'Select email app to open',
                );
                if (!result.didOpen && !result.canOpen) {
                  showNoMailAppsDialog(context);
                } else if (!result.didOpen && result.canOpen) {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return MailAppPickerDialog(
                        mailApps: result.options,
                      );
                    },
                  );
                }
                // AppRouter.goTo(screenName: ScreenName.createNewPasswordScreen);
              },
            ),
            const SizedBox(height: 16),
            CustomButtonWidget(
              title: AppStrings.iConfirmLatter,
              textColor: ColorManager.gray,
              fontSize: 14,
              onPressed: () {
                sl<AppRouter>().goToAndRemove(screenName: ScreenName.loginScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}
