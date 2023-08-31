import 'package:flutter/material.dart';
import 'package:gym_app/feature/onBoardingScreens/model/pageViewModel.dart';
import 'package:gym_app/sheared/widget/CustomeSvg.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';
import 'package:gym_app/utils/resources/icons_constant.dart';
import 'package:gym_app/utils/resources/images_constant.dart';



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
        Image.asset(
          ImageApp.logo,
          color: Colors.black,
          width: 45,
          height: 44,
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
