import 'package:flutter/material.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';

class OnBoardingIndicator extends StatelessWidget {
  final bool selected;
  final Color mainColor;
  final Color sColor;

  const OnBoardingIndicator({
    super.key,
    required this.selected,
    required this.mainColor,
    required this.sColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? mainColor : sColor,
      ),
    );
  }
}

class ShopProductIndicator extends StatelessWidget {
  final bool selected;

  const ShopProductIndicator({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: selected ? 25 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: selected ? ColorManager.primary : ColorManager.secondPrimary,
      ),
    );
  }
}
//         color: selected? Colors.white : const Color.fromRGBO(255, 255, 255, 0.5),
