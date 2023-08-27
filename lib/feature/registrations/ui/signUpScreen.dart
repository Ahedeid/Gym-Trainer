import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gym_app/feature/registrations/provider/signUpProvider.dart';
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool selected = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: Consumer<SignUpProvider>(
          builder: (context, value, child) => Form(
            key: value.signUpFormKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingHorizontal),
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                CustomSvgAssets(
                  path: AppIcons.logo,
                  width: 46,
                  height: 44,
                  color: ColorManager.black,
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.signUp,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: FontSize.s26,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.enterYourEmail,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w300,
                    color: ColorManager.secondaryTextColor,
                  ),
                ),
                const SizedBox(height: 40),
                TextFieldAndAboveText(
                  validator: (val) => val!.validateUserName(),
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  text: AppStrings.userName,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 14),
                TextFieldAndAboveText(
                  controller: emailController,
                  validator: (val) => val!.validateEmail(),
                  text: AppStrings.email,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 14),
                TextFieldAndAboveText(
                  controller: phoneController,
                  validator: (val) => val!.validatePhoneNumber(),
                  text: AppStrings.phone,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 14),
                TextFieldAndAboveText(
                  controller: passwordController,
                  validator: (val) => val!.validatePassword(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      value.isVisibility();
                    },
                    child: value.visibility
                        ? const Icon(
                            Icons.visibility_off,
                            size: 18,
                          )
                        : const Icon(Icons.visibility, size: 18),
                  ),
                  obscureText: value.visibility,
                  text: AppStrings.Password,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 48),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      AppRouter.goTo(screenName: ScreenName.loginScreen);
                    },
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: AppStrings.haveAnAccount,
                              style: TextStyle(
                                  color: ColorManager.secondaryTextColor,
                                  fontSize: FontSize.s16,
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                            text: " ${AppStrings.logIn}",
                            style: TextStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1)
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer<SignUpProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingHorizontal),
          child: CustomButtonWidget(
            isLoading: value.isLoading,
            title: AppStrings.signUp,
            fontWeight: FontWeight.w700,
            onPressed: () {
              value.signUp(
                name: nameController.text,
                email: emailController.text,
                password: passwordController.text,
                phone: phoneController.text,
              );
            },
          ),
        ),
      ),
    );
  }
}
