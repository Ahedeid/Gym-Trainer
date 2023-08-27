import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/utils/helper.dart';


class ProfileProvider extends ChangeNotifier {
  String name = '';
  String userName = '';
  DocumentSnapshot? userData;

  //----------------------------------------------------------------------------
  bool isLoading = false;

  setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<void> getADataUser() async {
    try {
      setLoading(true);
      String id = sl<SharedPrefController>().getUid();
      // print(id);
      final DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('user').doc(id).get();
      userData = userDoc;
      name = userDoc.get('name');
      userName = userDoc.get('userName');
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

//------------------------------------------------------------------------------
  bool isLoadingEdit = false;

  setLoadingEdit(bool val) {
    isLoadingEdit = val;
    notifyListeners();
  }

  Future<void> EditNameProfile({required String name,required String userName}) async {
    try {
      setLoadingEdit(true);
      String id = sl<SharedPrefController>().getUid();
      await FirebaseFirestore.instance
          .collection('user')
          .doc(id)
          .update({'name': name,
      'userName': userName
      });
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
}
