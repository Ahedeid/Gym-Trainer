import 'package:flutter/material.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalShimmerList extends StatelessWidget {
  final int itemCount;

  HorizontalShimmerList({required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        itemCount,
        (index) => Column(
          children: [
            ShimmerItem(
              width: 61,
              height: 61,
              shape: BoxShape.circle,
            ),
            8.addVerticalSpace,
            ShimmerItem(
              width: 50,
              height: 10,
              shape: BoxShape.rectangle,
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerItem extends StatelessWidget {
  final double width;
  final double height;
  final BoxShape shape;

  ShimmerItem({
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
