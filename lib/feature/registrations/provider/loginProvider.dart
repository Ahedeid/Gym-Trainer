import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gym_app/feature/registrations/model/user_model.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
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
      if (await checkIfDocExists(credentialSign.user!.uid) == false) {
        print('false');
        // Fetch user data from FireStore and update it
        await sl<FirebaseFirestore>()
            .collection(FirebaseConstant.usersCollection)
            .doc(credentialSign.user!.uid)
            .set({
          FirebaseConstant.uid: credentialSign.user!.uid,
          FirebaseConstant.email: credentialSign.user!.email,
          FirebaseConstant.name: credentialSign.user!.displayName,
          FirebaseConstant.phone: credentialSign.user!.phoneNumber,
          FirebaseConstant.image: credentialSign.user!.photoURL,
          FirebaseConstant.goal: 'DLlfkpNUXfPdjm8HIYmg',
          FirebaseConstant.level: 0.toString(),
        });
      }
      print('done');
      final UserModel user = UserModel(
        uid: credentialSign.user!.uid,
        name: credentialSign.user!.displayName!,
        email: credentialSign.user!.email!,
        image: credentialSign.user!.photoURL ?? '',
        phone: credentialSign.user!.phoneNumber ?? '',
        selectedGoal: '',
        level: 0.toString(),
      );
      UtilsConfig.navigateAfterSuccess(screenName: ScreenName.BNBUser);
      sl<SharedPrefController>().setLoggedIn();
      sl<SharedPrefController>().saveUserData(user);
      UtilsConfig.navigateAfterSuccess(screenName: ScreenName.BNBUser);
    } on FirebaseException catch (e) {
      UtilsConfig.showOnException(e);
    } finally {
      setLoadingGoogle(false);
    }
  }

  //----------------------------- Check If Document Exists ---------------------

  Future<bool> checkIfDocExists(String docId) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = await FirebaseFirestore.instance.collection('users');

      var doc = await collectionRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }
}
