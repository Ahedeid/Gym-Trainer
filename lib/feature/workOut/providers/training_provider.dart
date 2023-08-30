import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/registrations/model/user_model.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/service_locator.dart';

class TrainingProvider extends ChangeNotifier {
  // var selectedLevel = Level.values[0];
  String? selectedLevel = sl<SharedPrefController>().getUserData().selectedGoal;
  // Level? defaultLevel;
  void setSelectedGoal(String levelIndex) {
    selectedLevel = levelIndex;
    notifyListeners();
  }

  Future<void> updateUserLevel(String level) async {
    print("update");
    try {
      // Update the 'goal' field in the user's document
      await sl<FirebaseFirestore>()
          .collection(FirebaseConstant.usersCollection)
          .doc(sl<SharedPrefController>().getUserData().uid)
          .update({FirebaseConstant.level: level});
      // await getGoalData(newGoalId);
      // If you also want to update the local user model, you can do that here
      UserModel currentUser = sl<SharedPrefController>().getUserData();
      setSelectedGoal(level);
      currentUser = currentUser.copyWith(selectedGoal: level.toString());
      sl<SharedPrefController>().saveUserData(currentUser);
      notifyListeners();
    } catch (e) {
      print('Error updating user goal: $e');
    }
  }

  // Future getGoalData(newGoalId) async {
  //   DocumentSnapshot d = await sl<FirebaseFirestore>()
  //       .collection(FirebaseConstant.goalsCollection)
  //       .doc(newGoalId)
  //       .get();
  //   goalModel = GoalModel.fromDocumentSnapshot(d);
  //   notifyListeners();
  // }
}