import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/feature/home_screen/providers/home_provider.dart';
import 'package:gym_app/feature/home_screen/ui/widgets/horizontal_exercise_widget.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/utils/resources/strings_in_app.dart';
import 'package:provider/provider.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) =>
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection(FirebaseConstant.exercisesCollection)
            .where(
              FirebaseConstant.title,
              isGreaterThanOrEqualTo: value.searchData,
            )
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    const CircularProgressIndicator()); // Loading indicator while data is fetched
          }
          if (!snapshot.hasData || snapshot.data?.docs.isEmpty == true) {
            return Center(
              child: Text('${AppStrings.noItems.tr()}( ${value.searchData} )'),
            ); // Display a message if no data is available
          }

          final docs = snapshot.data!.docs;

          return value.searchData.trim().isEmpty || value.searchData.isEmpty
              ? SizedBox.shrink()
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.w, vertical: 13.h),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.transparent,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final doc = docs[index];
                      final exercise = ExerciseModel.fromDocumentSnapshot(doc);

                      return GestureDetector(
                        onTap: () {},
                        child: HorizontalExerciseWidget(
                          exerciseModel: exercise,
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }

// Widget buildSearchResults(ProfileController value) {
//   return
//   // Build search results UI
}
