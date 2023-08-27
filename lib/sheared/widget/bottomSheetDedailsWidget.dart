import 'package:flutter/material.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
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
    return MainContainer(
      horizontal: AppSizes.paddingHorizontal,
      color: ColorManager.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // shrinkWrap: true,
        // physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          Container(
            width: 49,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFAAABAE)),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.dailyAttendance,
                style: StyleManger.headline1(),
              ),
              IconButton(
                onPressed: () {
                  AppRouter.mayBack();
                },
                icon: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFFBFBFB)),
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          ScanWidgetBottomSheet(
            image: AppIcons.qrScan,
            text: AppStrings.scanBarcode,
          ),
          ScanWidgetBottomSheet(
            image: AppIcons.scanApp,
            text: AppStrings.scanAppBarcode,
          ),
          MainContainer(
            color: ColorManager.backGroundSecondary,
            child: CustomSvgAssets(
              path: AppIcons.clickIcon,
            ),
            width: 44,
            height: 44,
          ),
          const SizedBox(height: 16),
          CustomButtonWidget(
            title: AppStrings.manualAttend,
            onPressed: () {},
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  maximumSize:
                      const MaterialStatePropertyAll(Size(double.infinity, 50)),
                  backgroundColor:
                      const MaterialStatePropertyAll(ColorManager.secondary),
                ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ScanWidgetBottomSheet extends StatelessWidget {
  const ScanWidgetBottomSheet(
      {super.key, required this.text, required this.image});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainContainer(
          color: ColorManager.backGroundSecondary,
          child: CustomSvgAssets(
            path: image,
          ),
          width: 44,
          height: 44,
        ),
        const SizedBox(height: 16),
        Text(
          text,
          style: StyleManger.headline4(),
        ),
        const SizedBox(height: 16),
        const Divider(
          color: Color(0xFFE6EDE9),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
