import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/style_manger.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.iconAction,
    this.onTap,
    this.visible = false,
  });

  final String title;
  final String? iconAction;
  final void Function()? onTap;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: color,
      elevation: 0,
      centerTitle: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 10.addVerticalSpace,
          Text(title.toUpperCase(), style: StyleManger.headline1()),
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
        10.addHorizontalSpace
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
