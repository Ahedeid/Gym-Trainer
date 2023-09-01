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

  // nextExercise() {
  //   print("${exerciseResult!.length}");
  //   exerciseResult!.add(trainingExerciseModel!);
  //   trainingExerciseModel = exerciseResult![0];
  //   print("when add ${exerciseResult!.length}");
  //   exerciseResult!
  //       .removeWhere((element) => trainingExerciseModel!.id == element.id);
  //   // exerciseResult!
  //   //     .removeWhere((element) => trainingExerciseModel!.id == element.id);
  //   print("the list ${exerciseResult!.length}");
  //   notifyListeners(); // Notify listeners to rebuild the UI
  // }
  // void nextExercise() {
  //   if (exerciseResult != null && exerciseResult!.isNotEmpty) {
  //     print("Current list length: ${exerciseResult!.length}");
  //
  //     // Move the current trainingExerciseModel to the end of the list
  //     exerciseResult!.add(trainingExerciseModel!);
  //
  //     // Remove the first item from the list and assign it to trainingExerciseModel
  //     trainingExerciseModel = exerciseResult!.removeAt(0);
  //
  //     print("Updated list length: ${exerciseResult!.length}");
  //
  //     notifyListeners(); // Notify listeners to rebuild the UI
  //   } else {
  //     // Handle the case where exerciseResult is empty or null
  //     print("No more exercises in the list.");
  //   }
  // }
  int currentIndex = 0;
  void selectNextItem() {
    // setState(() {
    // Rotate the list to the right to select the next item
    exerciseResult!
        .insert(0, exerciseResult!.removeAt(exerciseResult!.length - 1));
    currentIndex = 0;
    notifyListeners();
    // });
  }

  String currentItem = "Item 1";
  void nextExercise() {
    List<String> itemList = ["Item 2", "Item 3", "Item 4"];
    ListSelector selector = ListSelector(itemList);
    print("this is Current Item $currentItem");

    itemList.add(currentItem);
    print("this is the list $itemList");
    currentItem = itemList[currentIndex];
    itemList.removeAt(currentIndex + 1);
    print("this is NEW Current Item $currentItem");
    // itemList.removeAt(currentIndex);
  }
}

class ListSelector {
  final List<String> items;
  int currentIndex = 0;

  ListSelector(this.items);

  String selectNextItem() {
    if (items.isEmpty) {
      return "List is empty";
    } else {
      // Increment the index to select the next item
      currentIndex = (currentIndex + 1) % items.length;
      return items[currentIndex];
    }
  }
}
