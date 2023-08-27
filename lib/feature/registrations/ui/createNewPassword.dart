import 'package:flutter/material.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/sheared/widget/textField_and_above_text.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/validate_extension.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();

  bool visibility = true;

  isVisibility() {
    setState(() {
      visibility = !visibility;
    });
  }

  bool visibility2 = true;

  isVisibility2() {
    setState(() {
      visibility2 = !visibility2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: Form(
          key: newPasswordFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingHorizontal),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                ),
                CustomSvgAssets(
                  path: AppIcons.lock,
                  width: 46,
                  height: 44,
                  color: ColorManager.black,
                ),
                const SizedBox(height: 11),
                const Text(
                  AppStrings.createNewPassword,
                  style: TextStyle(
                    fontSize: FontSize.s22,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your new password must be different from previous used passwords.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: FontSize.s15,
                    color: ColorManager.secondaryTextColor,
                  ),
                ),
                const SizedBox(height: 24),
                TextFieldAndAboveText(
                  controller: passwordController,
                  validator: (val) => val!.validatePassword(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isVisibility();
                    },
                    child: visibility
                        ? const Icon(
                            Icons.visibility_off,
                            size: 18,
                          )
                        : const Icon(Icons.visibility, size: 18),
                  ),
                  obscureText: true,
                  text: AppStrings.Password,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 14),
                TextFieldAndAboveText(
                  controller: confirmPasswordController,
                  validator: (val) => val!.validatePassword(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isVisibility2();
                    },
                    child: visibility2
                        ? const Icon(
                            Icons.visibility_off,
                            size: 18,
                          )
                        : const Icon(Icons.visibility, size: 18),
                  ),
                  obscureText: true,
                  text: AppStrings.confirmPassword,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal),
        child: CustomButtonWidget(
          title: AppStrings.confirm,
          onPressed: () {
            if (newPasswordFormKey.currentState!.validate()) {
              if (passwordController.text == confirmPasswordController.text) {
                AppRouter.goToAndRemove(screenName: ScreenName.loginScreen);
              }
            }
          },
        ),
      ),
    );
  }
}
