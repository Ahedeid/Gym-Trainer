import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/header_section_widget.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/vertical_exercise_list.dart';
import 'package:gym_app/feature/workOut/providers/training_provider.dart';
import 'package:gym_app/feature/workOut/widgets/training_level_list.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/utils/extensions/sized_box.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:provider/provider.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.training.tr(),
          onTap: () {},
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 25),
            child: Consumer<TrainingProvider>(
              builder: (context, trainingProvider, child) => Column(
                children: [
                  SizedBox(
                    height: 35,
                    child: Center(child: TrainingLevelList()),
                  ),
                  25.addVerticalSpace,
                  HeaderSectionWidget(
                    trailing: "",
                    title: AppStrings.popularTraining.tr(),
                  ),
                  10.addVerticalSpace,
                  StreamBuilder<QuerySnapshot>(
                    stream: sl<FirebaseFirestore>()
                        .collection(FirebaseConstant.exercisesCollection)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final categoryDocs = snapshot.data!.docs;
                      final resultList = trainingProvider.filterExerciseByLevel(
                          categoryDocs, trainingProvider.selectedLevel);

                      return resultList.length == 0
                          ? Center(
                              child: Text(
                                "No Exercise",
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          : VerticalExerciseList(resultList: resultList);
                    },
                  ),
                  // Divider(),
                ],
              ),
            ),
          ),
        ));
  }
}
