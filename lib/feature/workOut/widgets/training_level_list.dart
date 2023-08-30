import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/feature/workOut/providers/training_provider.dart';
import 'package:gym_app/feature/workOut/widgets/training_level_widget.dart';
import 'package:gym_app/service_locator.dart';

class TrainingLevelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 13.w,
      ),
      itemCount: Level.values.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        Level level = Level.values[index];

        return GestureDetector(
            onTap: () {
              sl<TrainingProvider>().updateUserLevel(level.index.toString());
            },
            child: TrainingLevelWidget(
              level: level,
            ));
      },
    );
  }
}
