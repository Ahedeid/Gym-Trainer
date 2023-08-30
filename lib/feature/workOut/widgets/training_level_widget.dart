import 'package:flutter/material.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/resources/colors_manger.dart';

class TrainingLevelWidget extends StatelessWidget {
  final Level? level;
  const TrainingLevelWidget({
    this.level,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: sl<SharedPrefController>().getUserData().level == level?.index
            ? Colors.black // Highlight selected goal
            : ColorManager.greyButton,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "${level?.name}",
          style: TextStyle(
              color:
                  sl<SharedPrefController>().getUserData().level == level?.index
                      ? ColorManager.white
                      : ColorManager.black,
              fontSize: 14),
        ),
      ),
    );
  }
}
