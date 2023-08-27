import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/logic/model/user_model.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/helper.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoadingReSet = false;
  UserModel? user;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  var fbAuth = sl<FirebaseAuth>();

  bool visibility = true;

  isVisibility() {
    visibility = !visibility;
    notifyListeners();
  }

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    if (loginFormKey.currentState!.validate()) {
      try {
        setLoading(true);
        final credential = await fbAuth.signInWithEmailAndPassword(
            email: email, password: password);
        sl<SharedPrefController>().setLogedin();
        final uid = credential.user!.uid;
        print(uid);
        sl<SharedPrefController>().setUId(uid);
        // SharedPrefController().save(credential);
        sl<AppRouter>()
            .goToAndRemove(screenName: ScreenName.BNBUser, object: 0);
        setLoading(false);
      } on FirebaseException catch (e) {
        setLoading(false);
        final message = e.message.toString();
        UtilsConfig.showSnackBarMessage(
          message: message,
          status: false,
        );
      }
    }
  }

  //------------------------------ ReSet Password ------------------------------

  final GlobalKey<FormState> reSetPasswordFormKey = GlobalKey<FormState>();

  setLoadingReSet(bool value) {
    isLoadingReSet = value;
    notifyListeners();
  }

  Future<void> reSetPassword({
    required String email,
  }) async {
    if (reSetPasswordFormKey.currentState!.validate()) {
      try {
        setLoadingReSet(true);
        await fbAuth.sendPasswordResetEmail(email: email);
        sl<AppRouter>().goToAndRemove(screenName: ScreenName.checkEmailScreen);
        setLoadingReSet(false);
      } on FirebaseException catch (e) {
        setLoadingReSet(false);
        final message = e.message.toString();
        UtilsConfig.showSnackBarMessage(
          message: message,
          status: false,
        );
      }
    }
  }
}
