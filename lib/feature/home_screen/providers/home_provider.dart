import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_app/feature/home_screen/models/categorie_model.dart';
import 'package:gym_app/feature/home_screen/models/goal_model.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/logic/model/user_model.dart';
import 'package:gym_app/service_locator.dart';

class HomeProvider extends ChangeNotifier {
  final UserModel user;
  String? selectedGoal = sl<SharedPrefController>().getUserData().selectedGoal;
  List<String>? selectedGoalIdList = [];
  GoalModel? goalModel;
  HomeProvider() : user = sl<SharedPrefController>().getUserData() {
    selectedGoal = user.selectedGoal;
    updateUserGoal(user.selectedGoal);
  }

  // Update the user's goal in Firestore
  Future<void> updateUserGoal(String newGoalId) async {
    print("update");
    try {
      // Update the 'goal' field in the user's document
      await sl<FirebaseFirestore>()
          .collection(FirebaseConstant.usersCollection)
          .doc(user.uid)
          .update({FirebaseConstant.goal: newGoalId});
      await getGoalData(newGoalId);
      // If you also want to update the local user model, you can do that here
      UserModel currentUser = sl<SharedPrefController>().getUserData();
      setSelectedGoal(newGoalId);
      currentUser = currentUser.copyWith(selectedGoal: newGoalId);
      sl<SharedPrefController>().saveUserData(currentUser);
      notifyListeners();
    } catch (e) {
      print('Error updating user goal: $e');
    }
  }

  Future getGoalData(newGoalId) async {
    DocumentSnapshot d = await sl<FirebaseFirestore>()
        .collection(FirebaseConstant.goalsCollection)
        .doc(newGoalId)
        .get();
    goalModel = GoalModel.fromDocumentSnapshot(d);
    notifyListeners();
  }

  List<CategoryModel> filterCategoriesByGoal(
      List<DocumentSnapshot> categoryDocs, List<dynamic> goalCategoryList) {
    final categoryList =
        categoryDocs.map((e) => CategoryModel.fromDocumentSnapshot(e)).toList();

    final resultList = categoryList.where((element) {
      return goalCategoryList.contains(element.id);
    }).toList();

    return resultList;
  }

  // Set the selected goal in the provider
  void setSelectedGoal(String goalId) {
    selectedGoal = goalId;
    notifyListeners();
  }
}
