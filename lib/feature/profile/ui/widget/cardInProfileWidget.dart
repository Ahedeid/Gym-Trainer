import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/style_manger.dart';


class CardInProfileWidget extends StatelessWidget {
  const CardInProfileWidget({
    required this.title,
    this.onTap,
    super.key,
  });

  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: ColorManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      title: Text(
        title,
        style: StyleManger.headline4(),
      ),
      trailing: MainContainer(
        height: 22,
        width: 22,
        color: ColorManager.screenGp,
        child: CustomSvgAssets(
          path: AppIcons.arrowNext,
        ),
      ),
    );
  }
}