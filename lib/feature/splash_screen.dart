import 'package:flutter/material.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool onBoardingShows = SharedPrefController().getShowOnce();
    bool isLogIn = SharedPrefController().getLogedin();
    Future.delayed(
      const Duration(seconds: 3),
      () => AppRouter.goToAndRemove(
        screenName:
            // ScreenName.BNBUser
            isLogIn
                ? ScreenName.BNBUser
                : onBoardingShows
                    ? ScreenName.loginScreen
                    : ScreenName.pageViewScreens,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Stack(
        children: [
          CustomSvgAssets(
            path: AppIcons.vectorSplash,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            color: const Color(0xFF134179),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSvgAssets(
                  path: AppIcons.logo,
                  color: ColorManager.white,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 18),
                const Text(
                  AppStrings.technoGym,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
