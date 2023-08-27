import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/style_manger.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    this.iconAction,
    this.onTap,
    this.onTapAnother,
    this.color = Colors.transparent,
    this.visible = false,
  });

  final String title;
  final String subTitle;
  final String? iconAction;
  final void Function()? onTap;
  final void Function()? onTapAnother;
  final Color color;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Text(title, style: StyleManger.headline1()),
          Text(
            subTitle,
            style: TextStyle(
                fontSize: FontSize.s14,
                fontWeight: FontWeight.w300,
                color: ColorManager.primaryTextColor),
          ),
          SizedBox(height: 10),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(8)),
            child: CustomSvgAssets(
              path: AppIcons.message,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: onTapAnother,
          child: Container(
            width: 42,
            height: 42,
            margin: const EdgeInsets.only(left: 8, right: 33),
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(8)),
            child: CustomSvgAssets(
              path: AppIcons.notification,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
