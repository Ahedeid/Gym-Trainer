import 'package:flutter/material.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/horizontal_exercise_widget.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';

class HorizontalExerciseList extends StatelessWidget {
  const HorizontalExerciseList({
    super.key,
    required this.resultList,
  });

  final List<ExerciseModel> resultList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: resultList.length,
      separatorBuilder: (context, index) => Column(
        children: [
          10.addVerticalSpace,
          Divider(),
          10.addVerticalSpace,
        ],
      ),
      itemBuilder: (context, index) {
        return HorizontalExerciseWidget(
          exerciseModel: resultList[index],
        );
      },
    );
  }
}
