import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { user, token, logedIn, showOnce }

class SharedPrefController {
  static final _instance = SharedPrefController._();

  factory SharedPrefController() {
    return _instance;
  }

  late SharedPreferences preferences;

  SharedPrefController._();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  setShowOnce(bool showOnce) async {
    await preferences.setBool(PrefKeys.showOnce.toString(), showOnce);
  }

  bool getShowOnce() =>
      preferences.getBool(PrefKeys.showOnce.toString()) ?? false;

  // save(UserCredential user) async {
  //    String userEncoded = jsonEncode(user);
  //   await preferences.setString(
  //     PrefKeys.user.toString(),
  //     userEncoded,
  //   );
  // }

  setUId(String uid) async {
    await preferences.setString(PrefKeys.user.toString(), uid);
  }

  String getUid() =>
    preferences.getString(PrefKeys.user.toString()) ?? 'error';


  // setLang(String lang ) async{
  //   await preferences.setString('lang', lang);
  // }
  //
  // getLang() async{
  //   await preferences.getString('lang');
  // }

  setLogedin() async {
    await preferences.setBool(PrefKeys.logedIn.toString(), true);
  }

  bool getLogedin() =>
      preferences.getBool(PrefKeys.logedIn.toString()) ?? false;

  // UserCredential getUser() {
  //   String userJson = preferences.getString(PrefKeys.user.toString()) ?? '';
  //   print(userJson);
  //   // String encodedString = jsonEncode(userJson);
  //   // print(encodedString);
  //   final userObject = jsonDecode(userJson);
  //   print(userObject);
  //   // UserCredential userObject = jsonDecode(userJson);
  //   return userObject;
  // }

  void removeUser() {
    preferences.remove(PrefKeys.user.toString());
    preferences.remove(PrefKeys.logedIn.toString());
  }

  clear() {
    preferences.clear();
  }
}
