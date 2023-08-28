import 'dart:convert';

import 'package:gym_app/logic/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { user, token, loggedIn, showOnce }

class SharedPrefController {
  SharedPreferences preferences;
  SharedPrefController({required this.preferences});

  setShowOnce(bool showOnce) async {
    await preferences.setBool(PrefKeys.showOnce.toString(), showOnce);
  }

  bool getShowOnce() =>
      preferences.getBool(PrefKeys.showOnce.toString()) ?? false;

  setLoggedIn() async {
    await preferences.setBool(PrefKeys.loggedIn.toString(), true);
  }

  bool getLoggedIn() =>
      preferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  void removeUser() {
    if (preferences.containsKey(PrefKeys.user.toString())) {
      preferences.remove(PrefKeys.user.toString());
    }
    if (preferences.containsKey(PrefKeys.loggedIn.toString())) {
      preferences.remove(PrefKeys.loggedIn.toString());
    }
  }

  clear() {
    preferences.clear();
  }

  Future<void> saveUserData(UserModel user) async {
    preferences.setString(PrefKeys.user.toString(), jsonEncode(user.toJson()));
  }

  UserModel getUserData() {
    final userData = preferences.getString(PrefKeys.user.toString());

    if (userData != null) {
      return UserModel.fromJson(jsonDecode(userData));
    }
    return UserModel(
      uid: '',
      name: '',
      email: '',
      image: '',
      phone: '',
      selectedGoal: '',
    );
  }
}
