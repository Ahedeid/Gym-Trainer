import 'package:flutter/material.dart';
import 'package:gym_app/feature/registrations/provider/loginProvider.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/style_manger.dart';
import 'package:provider/provider.dart';
import 'package:gym_app/feature/registrations/provider/signUpProvider.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/sheared/widget/textField_and_above_text.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
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
        child: Consumer2<SignUpProvider, LoginProvider>(
          builder: (context, value, login, child) => Form(
            key: value.signUpFormKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingHorizontal),
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.createAccounts,
                  style: TextStyle(
                    fontSize: FontSize.s30,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.pleaseEnterYourCredentials,
                  style: TextStyle(
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 32),
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
                const SizedBox(height: 30),
                CustomButtonWidget(
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
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.orLoginWith,
                    style: StyleManger.bodyText(),
                  ),
                ),
                SizedBox(height: 16),
                CustomButtonWidget(
                  isLoading: login.isLoadingSignInWithGoogle,
                  showIcon: true,
                  icon: AppIcons.google,
                  title: AppStrings.connectWithGoogle,
                  fontWeight: FontWeight.w600,
                  textColor: ColorManager.primaryTextColor,
                  fontSize: FontSize.s14,
                  onPressed: () {
                    login.signInWithGoogle();
                  },
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        backgroundColor: MaterialStatePropertyAll(
                            ColorManager.backgroundInputFiled),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                              width: 1.0, color: ColorManager.borderColor),
                        ),
                      ),
                ),
                SizedBox(height: 8),
                CustomButtonWidget(
                  // isLoading: value.isLoading,
                  showIcon: true,
                  icon: AppIcons.facebook,
                  title: AppStrings.connectWithFacebook,
                  fontWeight: FontWeight.w600,
                  fontSize: FontSize.s14,
                  onPressed: () {},
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      backgroundColor: MaterialStatePropertyAll(
                          ColorManager.buttonFacebookColor)),
                ),
                SizedBox(height: 42),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      sl<AppRouter>().goTo(screenName: ScreenName.loginScreen);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.haveAnAccount,
                            style: StyleManger.headline2(
                              fontSize: FontSize.s16,
                              color: ColorManager.secondaryTextColor,
                            ),
                          ),
                          TextSpan(
                            text: AppStrings.logIn,
                            style: StyleManger.headline2(
                              color: ColorManager.primary,
                              fontSize: FontSize.s16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
