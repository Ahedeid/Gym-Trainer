import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:shimmer/shimmer.dart';

class GoalWidgetShimmerList extends StatelessWidget {
  final int itemCount;

  GoalWidgetShimmerList({required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => 1.addHorizontalSpace,
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) => GoalWidgetShimmer(
        width: 100.w,
        height: 1,
        shape: BoxShape.rectangle,
      ),
    );
  }
}

class GoalWidgetShimmer extends StatelessWidget {
  final double width;
  final double height;
  final BoxShape shape;

  GoalWidgetShimmer({
    required this.width,
    required this.height,
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: shape,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
