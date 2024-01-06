import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gym_app/feature/registrations/model/user_model.dart';
import 'package:gym_app/logic/firebase_constant.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileProvider extends ChangeNotifier {
  var auth = sl<FirebaseAuth>();
  UserModel? user;

  bool isLoadingEdit = false;

  setLoadingEdit(bool val) {
    isLoadingEdit = val;
    notifyListeners();
  }

  //-------------------------- EditUserProfile ----------------------------------

  Future<void> EditUserProfile({
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
        FirebaseConstant.image: imageURL,
      });
      // Fetch user data from FireStore and update it
      getGoalData(id);
      UserModel currentUser = sl<SharedPrefController>().getUserData();
      currentUser = currentUser.copyWithUserProfile(
        name: name,
        email: email,
        phone: phone,
        image: imageURL,
      );
      user = currentUser;
      sl<SharedPrefController>().saveUserData(currentUser);
      sl<AppRouter>().back(true);
      notifyListeners();
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
    // notifyListeners();
  }

  // --------------------------- get data user ------------------------------------
  bool isLoadingGetData = false;

  setLoadingGetData(bool val) {
    isLoadingGetData = val;
    notifyListeners();
  }

  Future getUserData() async {
    try {
      setLoadingGetData(true);
      String id = sl<SharedPrefController>().getUserData().uid;
      // Fetch user data from FireStore and update it
      final userDoc = await sl<FirebaseFirestore>()
          .collection(FirebaseConstant.usersCollection)
          .doc(id)
          .get();

      final userModel = UserModel.fromDocumentSnapshot(userDoc);
      user = userModel;
      setLoadingGetData(false);
    } on FirebaseException catch (e) {
      setLoadingGetData(false);
    }
  }

  // --------------------------- Edit Image ------------------------------------

  String? imageURL;
  File? _photo;
  final ImagePicker _picker = ImagePicker();
  bool isLoadingImage = false;

  setLoadingImage(bool val) {
    isLoadingImage = val;
    notifyListeners();
  }

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      uploadFile();
      sl<AppRouter>().back();
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      uploadFile();
      sl<AppRouter>().back();
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'UsersImages/$fileName';
    try {
      setLoadingImage(true);
      final ref = sl<FirebaseStorage>().ref(destination).child('file/');
      await ref.putFile(_photo!);
      String downloadUrl = await ref.getDownloadURL();
      imageURL = downloadUrl;
      setLoadingImage(false);
    } on FirebaseException catch (e) {
      UtilsConfig.showOnException(e);
      setLoadingImage(false);
    }
  }

  // --------------------------- LOGOUT ----------------------------------------
  Future<void> logout() async {
    try {
      // Clear navigation and any authentication-related data
      sl<AppRouter>().goToAndRemove(screenName: ScreenName.loginScreen);
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
