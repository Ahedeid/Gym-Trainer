import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/models/goal_model.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/goal_widget.dart';
import 'package:gym_app/service_locator.dart';

class GoalList extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;

  const GoalList({
    required this.snapshot,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 13.w,
      ),
      itemCount: snapshot.data!.docs.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final goal = GoalModel.fromDocumentSnapshot(
          snapshot.data!.docs[index],
        );

        return GestureDetector(
          onTap: () {
            sl<HomeProvider>().updateUserGoal(goal.id);
            // sl<HomeProvider>().setSelectedGoal(goal.id);
          },
          child: GoalWidget(goal: goal),
        );
      },
    );
  }
}
