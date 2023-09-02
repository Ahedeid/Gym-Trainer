import 'package:flutter/material.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
    required this.title,
    this.text = '',
    this.collapsedBackgroundColor = ColorManager.white,
  });

  final String title;
  final String text;
  final Color collapsedBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      collapsedBackgroundColor: collapsedBackgroundColor,
      title: Text(
        title,
        style: TextStyle(
          fontSize: FontSize.s14,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: MainContainer(
        height: 22,
        width: 22,
        color: ColorManager.screenGp,
        child: CustomSvgAssets(
          path: AppIcons.arrowDown,
        ),
      ),
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: FontSize.s14,
            color: ColorManager.secondaryTextColor,
          ),
        )
      ],
    );
  }
}
