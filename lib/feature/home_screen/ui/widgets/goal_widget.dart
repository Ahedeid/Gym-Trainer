import 'package:flutter/material.dart';
import 'package:gym_app/feature/home_screen/models/goal_model.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';

class GoalWidget extends StatelessWidget {
  const GoalWidget({
    super.key,
    required this.goal,
  });

  final GoalModel goal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:
            // sl<SharedPrefController>().getUserData().selectedGoal == goal.id
            //     ?
            // Colors.black // Highlight selected goal
            //     :
            ColorManager.greyButton,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          goal.name,
          style: TextStyle(
              color: sl<SharedPrefController>().getUserData().selectedGoal ==
                      goal.id
                  ? ColorManager.whiteText
                  : ColorManager.black,
              fontSize: 14),
        ),
      ),
    );
  }
}
