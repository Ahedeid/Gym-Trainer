import 'package:flutter/material.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
    this.height,
    this.color = ColorManager.primary,
    required this.child,
    this.horizontal = 0,
    this.vertical = 0,
    this.top = 0,
    this.bottom = 0,
    this.left = 0,
    this.right = 0,
    this.width,
    this.alignment,
  });

  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;
  final Color color;
  final Widget child;
  final double vertical;
  final double horizontal;
  final double top;
  final double bottom;
  final double left;
  final double right;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(bottom: bottom,left: left,right: right,top: top),
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: child,
    );
  }
}
