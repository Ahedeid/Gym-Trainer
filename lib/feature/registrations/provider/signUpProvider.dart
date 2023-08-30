import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_app/feature/registrations/model/user_model.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
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
            await sl<FirebaseAuth>().createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final uid = credential.user!.uid;
        await sl<FirebaseFirestore>()
            .collection(FirebaseConstant.usersCollection)
            .doc(uid)
            .set({
          FirebaseConstant.uid: uid,
          FirebaseConstant.email: email,
          FirebaseConstant.name: name,
          FirebaseConstant.phone: phone,
          FirebaseConstant.image: '',
          FirebaseConstant.goal: '',
        });
        await credential.user!.updateDisplayName("${name}");
        UtilsConfig.navigateAfterSuccess(screenName: ScreenName.loginScreen);
      } on FirebaseException catch (e) {
        setLoading(false);
        UtilsConfig.showOnException(e);
      }
    }
  }
}
