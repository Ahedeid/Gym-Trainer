import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/helper.dart';

class ProfileProvider extends ChangeNotifier {
  var auth = sl<FirebaseAuth>();
  //----------------------------------------------------------------------------
  bool isLoading = false;

  setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  bool isLoadingEdit = false;

  setLoadingEdit(bool val) {
    isLoadingEdit = val;
    notifyListeners();
  }

  Future<void> EditNameProfile(
      {required String name, required String userName}) async {
    try {
      setLoadingEdit(true);
      String id = sl<SharedPrefController>().getUserData().uid;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(id)
          .update({'name': name, 'userName': userName});
      sl<AppRouter>().back();
    } on FirebaseException catch (e) {
      final message = e.message.toString();
      UtilsConfig.showSnackBarMessage(
        message: message,
        status: false,
      );
    } finally {
      setLoadingEdit(false);
    }
  }

  void _navigateToLoginPage() {
    sl<AppRouter>().goToAndRemove(screenName: ScreenName.loginScreen);
  }

  Future<void> logout() async {
    try {
      // Clear navigation and any authentication-related data
      _navigateToLoginPage(); // This should be a function that handles navigation properly
      sl<SharedPrefController>().removeUser();

      // Disconnect and sign out from Google if applicable
      await sl<GoogleSignIn>().disconnect();
      await sl<GoogleSignIn>().signOut();

      // Sign out from Firebase Authentication
      await auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
