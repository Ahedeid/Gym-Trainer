import 'package:flutter/material.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/style_manger.dart';
import 'package:provider/provider.dart';
import 'package:gym_app/feature/registrations/provider/loginProvider.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/sheared/widget/textField_and_above_text.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                    const Text(
                      AppStrings.welcomeToProFitness,
                      style: TextStyle(
                        fontSize: FontSize.s24,
                        color: ColorManager.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 11),
                    const Text(
                      AppStrings.enterYourEmail,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: FontSize.s16,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.primaryTextColor,
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
                      validator: (val) => val!.validatePassword(),
                      obscureText: value.visibility,
                      text: AppStrings.Password,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          sl<AppRouter>()
                              .goTo(screenName: ScreenName.reSetPasswordScreen);
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
                    const SizedBox(height: 30),
                    Consumer<LoginProvider>(
                      builder: (context, value, child) => CustomButtonWidget(
                        isLoading: value.isLoading,
                        title: AppStrings.logIn,
                        fontWeight: FontWeight.w700,
                        fontSize: FontSize.s20,
                        onPressed: () {
                          value.login(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        },
                      ),
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
                       isLoading: value.isLoadingSignInWithGoogle,
                      showIcon: true,
                      icon: AppIcons.google,
                      title: AppStrings.connectWithGoogle,
                      fontWeight: FontWeight.w600,
                      textColor: ColorManager.primaryTextColor,
                      fontSize: FontSize.s14,
                      onPressed: () {
                        value.signInWithGoogle();
                      },
                      style:
                          Theme.of(context).elevatedButtonTheme.style?.copyWith(
                                backgroundColor: MaterialStatePropertyAll(
                                    ColorManager.backgroundInputFiled),
                                side: MaterialStatePropertyAll(
                                  BorderSide(
                                      width: 1.0,
                                      color: ColorManager.borderColor),
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
                      style: Theme.of(context)
                          .elevatedButtonTheme
                          .style
                          ?.copyWith(
                              backgroundColor: MaterialStatePropertyAll(
                                  ColorManager.buttonFacebookColor)),
                    ),
                    SizedBox(height: 42),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          sl<AppRouter>()
                              .goTo(screenName: ScreenName.signUpScreen);
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
                                text: AppStrings.signUp,
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
        ),
      ),
    );
  }
}
