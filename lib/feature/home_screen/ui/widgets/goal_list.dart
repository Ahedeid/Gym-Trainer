import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/models/goal_model.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/goal_widget.dart';
import 'package:gym_app/service_locator.dart';

class GoalList extends StatefulWidget {
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;

  const GoalList({
    required this.snapshot,
    super.key,
  });

  @override
  State<GoalList> createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // controller: _scrollController,
      separatorBuilder: (context, index) => SizedBox(
        width: 13.w,
      ),
      itemCount: widget.snapshot.data!.docs.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final goal = GoalModel.fromDocumentSnapshot(
          widget.snapshot.data!.docs[index],
        );

        return GestureDetector(
          onTap: () {
            sl<HomeProvider>().updateUserGoal(goal.id);
          },
          child: GoalWidget(goal: goal),
        );
      },
    );
  }
}
