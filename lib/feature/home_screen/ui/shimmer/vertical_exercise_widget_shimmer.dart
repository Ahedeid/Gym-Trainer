import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:shimmer/shimmer.dart';

class VerticalExerciseWidgetShimmerList extends StatelessWidget {
  final int itemCount;

  VerticalExerciseWidgetShimmerList({required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => 20.addVerticalSpace,
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          12.addVerticalSpace,
          VerticalExerciseWidgetShimmer(
            width: double.infinity,
            height: 155.h,
            shape: BoxShape.rectangle,
          ),
          8.addVerticalSpace,
          VerticalExerciseWidgetShimmer(
            width: 200.w,
            height: 20,
            shape: BoxShape.rectangle,
          ),
        ],
      ),
    );
  }
}

class VerticalExerciseWidgetShimmer extends StatelessWidget {
  final double width;
  final double height;
  final BoxShape shape;

  VerticalExerciseWidgetShimmer({
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
          borderRadius: BorderRadius.circular(10),
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
