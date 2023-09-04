import 'package:flutter/material.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class CustomAppBarSecondary extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarSecondary({
    super.key,
    required this.title,
    this.subTitle = '',
    this.iconAction,
    this.onTap,
    this.onTapAnother,
    this.color = Colors.transparent,
    this.bottom,
    this.showSubTitle = true,
  });

  final String title;
  final String subTitle;
  final String? iconAction;
  final void Function()? onTap;
  final void Function()? onTapAnother;
  final Color color;
  final PreferredSizeWidget? bottom;
  final bool showSubTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          sl<AppRouter>().back(true);
        },
        child: MainContainer(
          left: 6,
          right: 6,
          top: 13,
          bottom: 13,
          color: ColorManager.white,
          alignment: Alignment.center,
          child: CustomSvgAssets(
            path: AppIcons.back,
          ),
        ),
      ),
      title: showSubTitle
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(title, style: StyleManger.headline1()),
                Text(
                  subTitle,
                  style: const TextStyle(
                      fontSize: FontSize.s14,
                      fontWeight: FontWeight.w300,
                      color: ColorManager.primaryTextColor),
                ),
                const SizedBox(height: 10),
              ],
            )
          : Text(title, style: StyleManger.headline1()),
      bottom: bottom,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(bottom != null ? 125 : 70);
}
