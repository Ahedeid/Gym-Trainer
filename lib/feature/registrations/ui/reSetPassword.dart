import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/registrations/provider/loginProvider.dart';
import 'package:gym_app/sheared/widget/CustomSvg.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/sheared/widget/textField_and_above_text.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/validate_extension.dart';
import 'package:provider/provider.dart';

class ReSetPasswordScreen extends StatelessWidget {
  ReSetPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context, value, child) => GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild!.unfocus();
            }
          },
          child: Form(
            key: value.reSetPasswordFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingHorizontal),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                    ),
                    CustomSvgAssets(
                      path: AppIcons.password,
                      width: 46,
                      height: 44,
                      color: ColorManager.black,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Reset password',
                      style: TextStyle(
                        fontSize: FontSize.s22,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Enter the email associated with your account and we’ll send an email with instructions to reset your password!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: FontSize.s15,
                        color: ColorManager.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFieldAndAboveText(
                      controller: emailController,
                      validator: (val) => val!.validateEmail(),
                      text: email.tr(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 55,
        child: Consumer<LoginProvider>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingHorizontal),
            child: CustomButtonWidget(
              isLoading: value.isLoadingReSet,
              title: sendOTP.tr(),
              onPressed: () {
                value.reSetPassword(email: emailController.text.trim());
              },
            ),
          ),
        ),
      ),
    );
  }
}
