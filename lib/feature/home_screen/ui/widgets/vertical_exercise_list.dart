import 'package:flutter/material.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/vertical_exercise_widget.dart';

class VerticalExerciseList extends StatelessWidget {
  const VerticalExerciseList({
    super.key,
    required this.resultList,
  });

  final List<ExerciseModel> resultList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: resultList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return VerticalExerciseWidget(
            exerciseModel: resultList[index],
            // exerciseModel:
          );
        });
  }
}
