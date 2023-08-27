import 'package:flutter/material.dart';
import 'package:gym_app/feature/onBoardingScreens/model/pageViewModel.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:gym_app/utils/resources/font_size.dart';


class BodyTxtOnBoarding extends StatelessWidget {
  const BodyTxtOnBoarding({
    Key? key,
    required List<PageViewModel> data,
    required int index,
  }) : _data = data, _index = index, super(key: key);

  final List<PageViewModel> _data;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Text(
      _data[_index].bodyText,
      softWrap: true,
      textAlign: TextAlign.start,
      style: const TextStyle(
        color: ColorManager.secondaryTextColor,
        fontSize: FontSize.s14,
      ),
    );
  }
}
