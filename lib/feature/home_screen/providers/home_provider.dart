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
  // final UserModel user;
  // String? selectedGoal = sl<SharedPrefController>().getUserData().selectedGoal;
  // List<String>? selectedGoalIdList = [];
  // GoalModel? goalModel;
  // CategoryModel? categoryModel;
  // bool isAdditional = false;
  //
  // HomeProvider() : user = sl<SharedPrefController>().getUserData() {
  //   selectedGoal = user.selectedGoal;
  //   updateUserGoal(user.selectedGoal);
  // }

  UserModel? user;
  String? selectedGoal;
  List<String>? selectedGoalIdList = [];
  GoalModel? goalModel;
  CategoryModel? categoryModel;
  bool isAdditional = false;

  // HomeProvider() : user = _loadUserData() {
  //   selectedGoal = user.selectedGoal;
  //   notifyListeners();
  //   // updateUserGoal(user.selectedGoal);
  // }

  initUserData() {
    user = sl<SharedPrefController>().getUserData();
    notifyListeners();
    selectedGoal = user!.selectedGoal;
    updateUserGoal(selectedGoal!);
    // notifyListeners();
  }
  // static UserModel _loadUserData() {
  //   try {
  //     final userData = sl<SharedPrefController>().getUserData();
  //     return userData;
  //   } catch (e) {
  //     print('Error loading user data: $e');
  //     // Handle the error or provide default user data if necessary
  //     return UserModel(
  //       uid: '',
  //       name: '',
  //       email: '',
  //       image: '',
  //       phone: '',
  //       selectedGoal: "DLlfkpNUXfPdjm8HIYmg",
  //       level: "",
  //     );
  //   }
  // }

  // ----------------- Update the user's goal in Firestore ---------------------
  Future<void> updateUserGoal(String newGoalId) async {
    try {
      if (newGoalId.isNotEmpty) {
        // Update the 'goal' field in the user's document
        await sl<FirebaseFirestore>()
            .collection(FirebaseConstant.usersCollection)
            .doc(user!.uid)
            .update({FirebaseConstant.goal: newGoalId});
        await getGoalData(newGoalId);
        // If you also want to update the local user model, you can do that here
        UserModel currentUser = sl<SharedPrefController>().getUserData();
        setSelectedGoal(newGoalId);
        currentUser = currentUser.copyWith(selectedGoal: newGoalId);
        sl<SharedPrefController>().saveUserData(currentUser);
        notifyListeners();
      } else {
        print('Error: newGoalId is null or empty.');
      }
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

  Future getCategoryName(catId) async {
    DocumentSnapshot d = await sl<FirebaseFirestore>()
        .collection(FirebaseConstant.categoriesCollection)
        .doc(catId)
        .get();
    categoryModel = CategoryModel.fromDocumentSnapshot(d);
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

  List<ExerciseModel>? ExerciseDetailsList;
  setExerciseDetailsList(newList) {
    ExerciseDetailsList?.clear();
    ExerciseDetailsList = newList;
    // notifyListeners();
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
    exerciseResult?.clear();
    upNextList?.clear();
    currentIndex = 0;
    exerciseResult = neuList;

    if (exerciseResult!.isNotEmpty) {
      currentIndex = (currentIndex + 1) % exerciseResult!.length;
      upNextList = List.from(exerciseResult!);
      upNextList?.removeAt(currentIndex);
    }
  }

  int currentIndex = 0;
  final countDownController = CountDownController();
  List<ExerciseModel>? upNextList;

  void platStop() {
    countDownController.isPaused
        ? countDownController.resume()
        : countDownController.pause();
    notifyListeners();
  }

  void nextTarget(List<ExerciseModel> exerciseResult) {
    if (exerciseResult.isEmpty) {
      return;
    }

    currentIndex = (currentIndex + 1) % exerciseResult.length;
    final nextExercise = exerciseResult[currentIndex];
    final exerciseTime = int.parse(nextExercise.time!) * 60;

    countDownController.restart(duration: exerciseTime);
    countDownController.pause();

    // Create a copy of exerciseResult excluding the current exercise
    upNextList = List<ExerciseModel>.from(exerciseResult)
      ..removeAt(currentIndex);

    notifyListeners();
  }

  bool isShow = false;
  void showSearch() {
    isShow = !isShow;
    notifyListeners();
  }

  String searchData = "";
  void showSearchResult(search) {
    searchData = search;
    notifyListeners();
  }

  void changeAdditional(bool nValue) {
    isAdditional = nValue;
    notifyListeners();
  }
}
