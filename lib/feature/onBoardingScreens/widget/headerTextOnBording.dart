import 'package:flutter/material.dart';
import 'package:gym_app/feature/onBoardingScreens/model/pageViewModel.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';



class HeaderTxtOnBoarding extends StatelessWidget {
  const HeaderTxtOnBoarding({
    Key? key,
    required List<PageViewModel> data,
    required int index,
  }) : _data = data, _index = index, super(key: key);

  final List<PageViewModel> _data;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvgAssets(
          width: 36,
          height: 34,
          path: AppIcons.logo,
          color: Colors.black,
        ),
        const SizedBox(width: 11),
        Text(
          _data[_index].title,
          style: const TextStyle(
              fontSize: FontSize.s26,
              fontWeight: FontWeight.bold,
              color: ColorManager.primaryTextColor
          ),
        ),
      ],
    );
  }
}
