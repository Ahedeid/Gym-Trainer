import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_app/feature/home_screen/models/categorie_model.dart';
import 'package:gym_app/feature/home_screen/models/exercise_model.dart';
import 'package:gym_app/feature/home_screen/models/goal_model.dart';
import 'package:gym_app/feature/registrations/model/user_model.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/service_locator.dart';

class HomeProvider extends ChangeNotifier {
  final UserModel user;
  String? selectedGoal = sl<SharedPrefController>().getUserData().selectedGoal;
  List<String>? selectedGoalIdList = [];
  GoalModel? goalModel;

  // double savedScrollPosition = 0.0;

  HomeProvider() : user = sl<SharedPrefController>().getUserData() {
    selectedGoal = user.selectedGoal;
    updateUserGoal(user.selectedGoal);
  }

  // ----------------- Update the user's goal in Firestore ---------------------
  Future<void> updateUserGoal(String newGoalId) async {
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

// ------------------------ Filter Categories By Goal --------------------------

  List<CategoryModel> filterCategoriesByGoal(
      List<DocumentSnapshot> categoryDocs, List<dynamic> goalCategoryList) {
    final categoryList =
        categoryDocs.map((e) => CategoryModel.fromDocumentSnapshot(e)).toList();

    final resultList = categoryList.where((element) {
      return goalCategoryList.contains(element.id);
    }).toList();

    return resultList;
  }

// ----------------------------- Filter Exercise By Goal -----------------------
  List<ExerciseModel> filterExerciseByGoal(
      List<DocumentSnapshot> exerciseDocs, id) {
    final exerciseList =
        exerciseDocs.map((e) => ExerciseModel.fromDocumentSnapshot(e)).toList();

    final resultList = exerciseList.where((element) {
      return id == element.goalId;
    }).toList();
    return resultList;
  }

// ------------------------- Filter Exercise By Category -----------------------

  List<ExerciseModel> filterExerciseByGoalAndCategory({
    required List<DocumentSnapshot> exerciseDocs,
    required String goalId,
    required String categoryId,
  }) {
    final exerciseList =
        exerciseDocs.map((e) => ExerciseModel.fromDocumentSnapshot(e)).toList();

    final exerciseByGoalList = exerciseList.where((element) {
      return goalId == element.goalId;
    }).toList();
    final exerciseByCategoryList = exerciseByGoalList.where((element) {
      return categoryId == element.categoryId;
    }).toList();
    return exerciseByCategoryList;
  }

  //-------------------- Set the selected goal in the provider -----------------
  void setSelectedGoal(String goalId) {
    selectedGoal = goalId;
    notifyListeners();
  }

  saveScrollPosition(double scrollPosition) {
    print("this postion $scrollPosition");
    sl<SharedPrefController>().setPosition(scrollPosition);
  }

  ExerciseModel? trainingExerciseModel;

  setTrainingExercise(ExerciseModel? exerciseModel) {
    print("${exerciseModel!.title}");
    trainingExerciseModel = exerciseModel;
    notifyListeners();
  }

  List<ExerciseModel>? exerciseResult;

  setExerciseList(neuList) {
    exerciseResult = neuList;
  }

  int currentIndex = 0;
  final countDownController = CountDownController();

  void nextTarget() {
    currentIndex = (currentIndex + 1) % exerciseResult!.length;
    countDownController.pause();
    countDownController.reset();
    notifyListeners();
  }
}
