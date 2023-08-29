import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/logic/model/user_model.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/helper.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoadingReSet = false;
  bool isLoadingSignInWithGoogle = false;
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

  // Future<void> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   if (loginFormKey.currentState!.validate()) {
  //     try {
  //       setLoading(true);
  //       final credential = await fbAuth.signInWithEmailAndPassword(
  //           email: email, password: password);
  //       sl<SharedPrefController>().setLoggedIn();
  //       final uid = credential.user!.uid;
  //       print(uid);
  //       sl<SharedPrefController>().saveUser(credential.user);
  //       sl<SharedPrefController>().setUId(uid);
  //       sl<ProfileProvider>().fetchUserData();
  //
  //       sl<AppRouter>()
  //           .goToAndRemove(screenName: ScreenName.BNBUser, object: 0);
  //       setLoading(false);
  //     } on FirebaseException catch (e) {
  //       setLoading(false);
  //       final message = e.message.toString();
  //       UtilsConfig.showSnackBarMessage(
  //         message: message,
  //         status: false,
  //       );
  //     }
  //   }
  // }
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      setLoading(true);
      final credential = await fbAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fetch user data from Firestore and update it
      final userDoc = await sl<FirebaseFirestore>()
          .collection(FirebaseConstant.usersCollection)
          .doc(credential.user!.uid)
          .get();

      final userModel = UserModel.fromDocumentSnapshot(userDoc);

      sl<SharedPrefController>().setLoggedIn();
      sl<SharedPrefController>().saveUserData(userModel);

      sl<AppRouter>().goToAndRemove(screenName: ScreenName.BNBUser, object: 0);
    } on FirebaseException catch (e) {
      final message = e.message.toString();
      UtilsConfig.showSnackBarMessage(
        message: message,
        status: false,
      );
    } finally {
      setLoading(false);
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

//------------------------------ SignIn With Google ----------------------------

  setLoadingSignInWithGoogle(bool value) {
    isLoadingSignInWithGoogle = value;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    // setLoadingSignInWithGoogle(true);
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      sl<AppRouter>().goToAndRemove(screenName: ScreenName.BNBUser);
      final credentialSign =
          await FirebaseAuth.instance.signInWithCredential(credential);
      sl<SharedPrefController>().setLoggedIn();
      final uid = credentialSign.user!.uid;
      // sl<SharedPrefController>().setUId(uid);
      // setLoadingSignInWithGoogle(false);
    } on FirebaseException catch (e) {
      // setLoadingSignInWithGoogle(false);
      final message = e.message.toString();
      UtilsConfig.showSnackBarMessage(
        message: message,
        status: false,
      );
    }
  }
}
