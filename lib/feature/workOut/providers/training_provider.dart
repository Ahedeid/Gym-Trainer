import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/feature/registrations/model/user_model.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/service_locator.dart';

class TrainingProvider extends ChangeNotifier {
  final UserModel _user;
  String? _selectedLevel;

  TrainingProvider() : _user = sl<SharedPrefController>().getUserData() {
    _selectedLevel = _user.level.toString();
    updateUserLevel(_selectedLevel!); // Initialize the selectedLevel
  }

  String? get selectedLevel => _selectedLevel;

  void setSelectedLevel(String levelIndex) {
    _selectedLevel = levelIndex;
    notifyListeners();
  }

  Future<void> updateUserLevel(String level) async {
    try {
      final userDocRef = FirebaseFirestore.instance
          .collection(FirebaseConstant.usersCollection)
          .doc(_user.uid);

      // Update the 'level' field in the user's document in Firestore
      await userDocRef.update({FirebaseConstant.level: level});

      // Update the local user model and selected level
      final updatedUser = _user.copyWithLevel(level: level);
      sl<SharedPrefController>().saveUserData(updatedUser);
      setSelectedLevel(level);
      notifyListeners();
    } catch (e) {
      print('Error updating user level: $e');
    }
  }
}
