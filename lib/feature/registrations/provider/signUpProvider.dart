import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/logic/model/user_model.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/utils/helper.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  UserModel? user;

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

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
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final uid = credential.user!.uid;
        await FirebaseFirestore.instance.collection('user').doc(uid).set({
          'id': uid,
          'name': name,
          'userName': name.toLowerCase(),
          'phone': phone,
        });
        SharedPrefController().setLogedin();
        SharedPrefController().setUId(uid);
        UtilsConfig.showSnackBarMessage(
          message: 'Account was created Successfully!!',
          status: true,
        );
        AppRouter.goTo(screenName: ScreenName.BNBUser, object: 0);
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
