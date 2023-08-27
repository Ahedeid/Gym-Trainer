import 'package:flutter/material.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/utils/app_config.dart';
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
    sl<AppConfig>().onDone();
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
