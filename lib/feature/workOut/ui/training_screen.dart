import 'package:flutter/material.dart';
import 'package:gym_app/feature/workOut/widgets/training_level_list.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.training,
          onTap: () {},
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 22),
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                  child: Center(child: TrainingLevelList()),
                ),
              ],
            ),
          ),
        ));
  }
}
