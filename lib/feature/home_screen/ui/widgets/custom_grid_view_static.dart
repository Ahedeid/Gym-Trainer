import 'package:flutter/material.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/sheared/widget/bottomSheetDedailsWidget.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';

class CustomGridViewStatic extends StatelessWidget {
  CustomGridViewStatic({
    super.key,
    required this.iconsGrid,
    required this.titleGrid,
    required this.subTitleGrid,
    required this.titleButton,
  });

  final List iconsGrid;
  final List titleGrid;
  final List subTitleGrid;
  final List titleButton;

  final List rout = [
    ScreenName.qrScreen,
    ScreenName.qrScreen,
    ScreenName.classScreen,
    ScreenName.classScreen,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 170,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Expanded(
                  child: CustomSvgAssets(
                    path: iconsGrid[index],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  titleGrid[index],
                  style: const TextStyle(
                    color: ColorManager.white,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.s14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subTitleGrid[index],
                  style: const TextStyle(
                    color: ColorManager.white,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.s14,
                  ),
                ),
                const SizedBox(height: 8),
                CustomButtonWidget(
                  title: titleButton[index],
                  onPressed: () {
                    index == 0
                        ? showModalBottomSheet(
                            backgroundColor: Colors.white,
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                              ),
                            ),
                            // showDragHandle: true,
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) =>
                                const BottomSheetDetailsWidget(),
                          )
                        : sl<AppRouter>().goTo(screenName: rout[index]);
                  },
                  textColor: ColorManager.primary,
                  fontSize: FontSize.s14,
                  fontWeight: FontWeight.w500,
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        maximumSize:
                            const MaterialStatePropertyAll(Size(127, 40)),
                        minimumSize:
                            const MaterialStatePropertyAll(Size(127, 40)),
                        backgroundColor: const MaterialStatePropertyAll(
                            ColorManager.backGroundButtonSecondary),
                      ),
                )
              ],
            ),
          );
        });
  }
}
