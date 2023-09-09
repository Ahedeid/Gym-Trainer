import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/CustomSvg.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/sizes_in_app.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class BottomSheetDetailsWidget extends StatelessWidget {
  const BottomSheetDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 49,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFAAABAE)),
          ),
          // const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "limitReached".tr(),
                style: StyleManger.headline3(),
              ),
              IconButton(
                onPressed: () {
                  sl<AppRouter>().mayBack();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              )
            ],
          ),
          8.addVerticalSpace,
          CustomSvgAssets(
            path: AppIcons.subscribe,
            color: ColorManager.secondary400,
          ),
          // Spacer(),
          24.addVerticalSpace,
          Text(
            "youMustSubscribeToPaid".tr(),
            textAlign: TextAlign.center,
            style: StyleManger.headline4(),
          ),
          // Spacer(),
          32.addVerticalSpace,
          CustomButtonWidget(
            title: subscribeNow.tr(),
            onPressed: () {
              sl<AppRouter>()
                  .goTo(screenName: ScreenName.comingSoonScreen, object: true);
            },
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  maximumSize: const MaterialStatePropertyAll(
                    Size(
                      double.infinity,
                      50,
                    ),
                  ),
                  backgroundColor: const MaterialStatePropertyAll(
                    ColorManager.secondary,
                  ),
                ),
          ),
          32.addVerticalSpace,
        ],
      ),
    );
  }
}
