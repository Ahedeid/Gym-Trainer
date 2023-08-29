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
    try {
      setLoading(true);
      final credential = await sl<FirebaseAuth>().signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fetch user data from FireStore and update it
      final userDoc = await sl<FirebaseFirestore>()
          .collection(FirebaseConstant.usersCollection)
          .doc(credential.user!.uid)
          .get();

      final userModel = UserModel.fromDocumentSnapshot(userDoc);

      sl<SharedPrefController>().setLoggedIn();
      sl<SharedPrefController>().saveUserData(userModel);
      UtilsConfig.navigateAfterSuccess(screenName: ScreenName.BNBUser);
    } on FirebaseException catch (e) {
      UtilsConfig.showOnException(e);
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
        await sl<FirebaseAuth>().sendPasswordResetEmail(email: email);
        sl<AppRouter>().goToAndRemove(screenName: ScreenName.checkEmailScreen);
        setLoadingReSet(false);
      } on FirebaseException catch (e) {
        setLoadingReSet(false);
        UtilsConfig.showOnException(e);
      }
    }
  }

//------------------------------ SignIn With Google ----------------------------
  setLoadingGoogle(bool value) {
    isLoadingSignInWithGoogle = value;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    try {
      setLoadingGoogle(true);
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final credentialSign =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Fetch user data from FireStore and update it
      await sl<FirebaseFirestore>()
          .collection(FirebaseConstant.usersCollection)
          .doc(credentialSign.user!.uid)
          .set({
        FirebaseConstant.uid: credentialSign.user!.uid,
        FirebaseConstant.email: credentialSign.user!.email,
        FirebaseConstant.name: credentialSign.user!.displayName!.toLowerCase(),
        FirebaseConstant.phone: credentialSign.user!.phoneNumber,
        FirebaseConstant.image: credentialSign.user!.photoURL,
        FirebaseConstant.goal: '',
      });
      final userDoc = await sl<FirebaseFirestore>()
          .collection(FirebaseConstant.usersCollection)
          .doc(credentialSign.user!.uid)
          .get();
      final userModel = UserModel.fromDocumentSnapshot(userDoc);
      UtilsConfig.navigateAfterSuccess(screenName: ScreenName.BNBUser);
      sl<SharedPrefController>().setLoggedIn();
      sl<SharedPrefController>().saveUserData(userModel);
      UtilsConfig.navigateAfterSuccess(screenName: ScreenName.BNBUser);
    } on FirebaseException catch (e) {
      UtilsConfig.showOnException(e);
    } finally {
      setLoadingGoogle(false);
    }
  }
}

/*
   if(await isItems(credentialSign)){
        print('false');
      }else{
        print('true');
      }

        Future<bool> isItems(UserCredential userCredential) async {
    final collectionReference =
    sl<FirebaseFirestore>().collection("users").doc(userCredential.user!.uid).snapshots();
    return collectionReference.isEmpty;
  }
 */
