import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/feature/workOut/providers/training_provider.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';
import 'package:provider/provider.dart';

class TrainingLevelWidget extends StatelessWidget {
  final Level? level;
  const TrainingLevelWidget({
    this.level,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingProvider>(
      builder: (context, trainingProvider, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: trainingProvider.selectedLevel == level?.index.toString()
              ? Colors.black // Highlight selected goal
              : ColorManager.greyButton,
        ),
        child: Text(
          "${level?.name}".tr(),
          style: TextStyle(
              color: trainingProvider.selectedLevel == level?.index.toString()
                  ? ColorManager.white
                  : ColorManager.black,
              fontSize: 14.sp),
        ),
      ),
    );
  }
}
