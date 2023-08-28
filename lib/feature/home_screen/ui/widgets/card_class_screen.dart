import 'package:flutter/material.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class CardClassScreen extends StatelessWidget {
  const CardClassScreen({
    super.key,
    required this.image,
    required this.clock,
    required this.level,
    required this.iconLevel,
    required this.title,
    required this.praise,
    required this.typeTraining,
  });

  final String image;
  final String typeTraining;
  final String praise;
  final String title;
  final String iconLevel;
  final String level;
  final String clock;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        bottom: 8,
        vertical: 14,
        horizontal: 12,
        color: ColorManager.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  // height: 190,
                ),
                Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      width: 116,
                      height: 22,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorManager.secondary200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        typeTraining,
                        style: StyleManger.headline4(
                          fontSize: FontSize.s12,
                          color: ColorManager.secondary,
                        ),
                      ),
                    )),
                Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 65,
                      height: 22,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorManager.backGraoundGreen,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        praise,
                        style: StyleManger.headline3(
                          fontSize: FontSize.s12,
                          color: ColorManager.greenText,
                        ),
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 16),
            Text(title, style: StyleManger.headline2()),
            const SizedBox(height: 16),
            Row(
              children: [
                Row(
                  children: [
                    CustomSvgAssets(
                      path: iconLevel,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(level,
                            style: StyleManger.headline4(
                              fontSize: 12,
                              color: ColorManager.secondary,
                            )),
                        const SizedBox(height: 7),
                        Text(AppStrings.intensity,
                            style: StyleManger.headline4(
                                fontSize: 12,
                                color: ColorManager.secondaryTextColor)),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text(
                      '⌛',
                      style: TextStyle(fontSize: 29),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(clock,
                            style: StyleManger.headline4(
                              fontSize: 12,
                              color: const Color(0xFF0062A0),
                            )),
                        const SizedBox(height: 7),
                        Text(AppStrings.duration,
                            style: StyleManger.headline4(
                                fontSize: 12,
                                color: ColorManager.secondaryTextColor)),
                      ],
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text(
                  '01 MAY 2023',
                  style: StyleManger.headline4(
                      fontSize: FontSize.s12,
                      color: ColorManager.secondaryTextColor),
                ),
                const Spacer(),
                Expanded(
                  child: CustomButtonWidget(
                    title: AppStrings.readMore,
                    textColor: ColorManager.primary,
                    showIcon: true,
                    onPressed: () {
                      sl<AppRouter>().goTo(screenName: ScreenName.classDetailsScreen);
                    },
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style
                        ?.copyWith(
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xFFEFE8F9)),
                          minimumSize: const MaterialStatePropertyAll(
                            Size(double.infinity, 36),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
