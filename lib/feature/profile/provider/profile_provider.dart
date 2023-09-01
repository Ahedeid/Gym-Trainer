import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gym_app/feature/registrations/model/user_model.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/helper.dart';

class ProfileProvider extends ChangeNotifier {
  var auth = sl<FirebaseAuth>();
  UserModel? user;
  String? sEmail = sl<SharedPrefController>().getUserData().email;
  String? sName = sl<SharedPrefController>().getUserData().name;
  String? sPhone = sl<SharedPrefController>().getUserData().phone;

  // bool isLoading = false;
  //
  // setLoading(bool val) {
  //   isLoading = val;
  //   notifyListeners();
  // }

  bool isLoadingEdit = false;

  setLoadingEdit(bool val) {
    isLoadingEdit = val;
    notifyListeners();
  }

  //-------------------------- EditNameProfile ----------------------------------

  Future<void> EditNameProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      setLoadingEdit(true);
      String id = sl<SharedPrefController>().getUserData().uid;
      await sl<FirebaseFirestore>()
          .collection(FirebaseConstant.usersCollection)
          .doc(id)
          .update({
        FirebaseConstant.name: name,
        FirebaseConstant.email: email,
        FirebaseConstant.phone: phone,
      });
      // Fetch user data from FireStore and update it
      getGoalData(id);
      UserModel currentUser = sl<SharedPrefController>().getUserData();
      setUpdateData(name: name, email: email, phone: phone);
      currentUser = currentUser.copyWithUserProfile(
        name: name,
        email: email,
        phone: phone,
      );
      sl<SharedPrefController>().saveUserData(currentUser);
      sl<AppRouter>().back();
    } on FirebaseException catch (e) {
      UtilsConfig.showOnException(e);
    } finally {
      setLoadingEdit(false);
    }
  }

  Future getGoalData(id) async {
    final userDoc = await sl<FirebaseFirestore>()
        .collection(FirebaseConstant.usersCollection)
        .doc(id)
        .get();
    user = UserModel.fromDocumentSnapshot(userDoc);
    notifyListeners();
  }

  void setUpdateData({
    required String name,
    required String email,
    required String phone,
  }) {
    sEmail = name;
    sName = email;
    sPhone = phone;
    notifyListeners();
  }

  // --------------------------- LOGOUT ----------------------------------------
  Future<void> logout() async {
    try {
      // Clear navigation and any authentication-related data
      UtilsConfig.navigateAfterSuccess(
          screenName: ScreenName
              .loginScreen); // This should be a function that handles navigation properly
      sl<SharedPrefController>().removeUser();

      // Disconnect and sign out from Google if applicable
      await sl<GoogleSignIn>().disconnect();
      await sl<GoogleSignIn>().signOut();

      // Sign out from Firebase Authentication
      await auth.signOut();
    } on FirebaseException catch (e) {
      UtilsConfig.showOnException(e);
    }
  }
}
