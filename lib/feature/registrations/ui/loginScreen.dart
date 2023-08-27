import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gym_app/feature/registrations/provider/loginProvider.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingHorizontal),
          child: Consumer<LoginProvider>(
            builder: (context, value, child) => Form(
              key: value.loginFormKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      AppStrings.logIn,
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
                      controller: emailController,
                      validator: (val) => val!.validateEmail(),
                      text: AppStrings.email,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 14),
                    TextFieldAndAboveText(
                      controller: passwordController,
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          AppRouter.goTo(
                              screenName: ScreenName.reSetPasswordScreen);
                        },
                        child: const Text(
                          AppStrings.forgetPassword,
                          style: TextStyle(
                            fontSize: FontSize.s14,
                            color: ColorManager.primaryTextColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          AppRouter.goTo(screenName: ScreenName.signUpScreen);
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
                                text: " ${AppStrings.signUp}",
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
              isLoading: value.isLoading,
              title: AppStrings.logIn,
              fontWeight: FontWeight.w700,
              fontSize: FontSize.s16,
              onPressed: () {
                value.login(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
