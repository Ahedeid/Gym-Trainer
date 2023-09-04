import 'dart:convert';
import 'package:gym_app/feature/registrations/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { user, token, loggedIn, showOnce, scrollPosition, langCode, langIndex }

class SharedPrefController {
  SharedPreferences preferences;

  SharedPrefController({required this.preferences});

  // -----------------------  Show OnBoarding  ---------------------------------

  setShowOnce(bool showOnce) async {
    await preferences.setBool(PrefKeys.showOnce.toString(), showOnce);
  }

  bool getShowOnce() =>
      preferences.getBool(PrefKeys.showOnce.toString()) ?? false;

  // ---------------------------  User Logged in  ------------------------------

  setLoggedIn() async {
    await preferences.setBool(PrefKeys.loggedIn.toString(), true);
  }

  bool getLoggedIn() =>
      preferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  // ---------------------------  User Data  -----------------------------------

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
      level: "",
    );
  }

  setPosition(value) {
    preferences.setDouble(PrefKeys.scrollPosition.toString(), value);
  }

  getPosition() {
    preferences.getDouble(PrefKeys.scrollPosition.toString());
  }

  // ---------------------------  Language  ------------------------------------
  String get getLanguage =>
      preferences.getString(PrefKeys.langCode.toString()) ?? "en";

   setLanguage(String langCode) {
    preferences.setString(PrefKeys.langCode.toString(), langCode);
  }
  int get getIndexLang =>
      preferences.getInt(PrefKeys.langIndex.toString()) ?? 0;

  set setLanguageIndex(int langIndex) {
    preferences.setInt(PrefKeys.langIndex.toString(), langIndex);
  }
}
