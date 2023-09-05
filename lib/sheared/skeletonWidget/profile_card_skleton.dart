import 'package:flutter/material.dart';
import 'package:gym_app/sheared/skeletonWidget/baseShimmerWidget.dart';
import 'package:gym_app/sheared/widget/main_container.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';

class ProfileCardSkeleton extends StatelessWidget {
  const ProfileCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      tileColor: ColorManager.white,
      contentPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      leading: SizedBox(
          height: 59,
          width: 59,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Skeleton(),
          )),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton(
            width: size.width * 0.3,
          ),
          8.addVerticalSpace,
          Skeleton(
            width: size.width * 0.5,
          ),
        ],
      ),
      trailing: MainContainer(
          height: 30,
          width: 30,
          color: ColorManager.backGroundSecondary,
          child: Skeleton()),
    );
  }
}
