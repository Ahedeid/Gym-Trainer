import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/logic/model/user_model.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/helper.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  UserModel? user;

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  var fbAuth = sl<FirebaseAuth>();
  var fbStore = sl<FirebaseFirestore>();

  bool visibility = true;

  isVisibility() {
    visibility = !visibility;
    notifyListeners();
  }

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    if (signUpFormKey.currentState!.validate()) {
      try {
        setLoading(true);
        final credential = await fbAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final uid = credential.user!.uid;
        await fbStore
            .collection(FirebaseConstant.usersCollection)
            .doc(uid)
            .set({
          FirebaseConstant.uid: uid,
          FirebaseConstant.email: email,
          FirebaseConstant.name: name.toLowerCase(),
          FirebaseConstant.phone: phone,
        });
        await credential.user!.updateDisplayName("${name.toLowerCase()}");
        sl<SharedPrefController>().setLoggedIn();
        UtilsConfig.showSnackBarMessage(
          message: 'Account was created Successfully!!',
          status: true,
        );
        sl<AppRouter>()
            .goToAndRemove(screenName: ScreenName.loginScreen, object: 0);
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
}
//  service locator , add a instance
