import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  // Obtain shared preferences.

  static String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    String minutesString = minutes.toString().padLeft(2, '0');
    String secondsString = remainingSeconds.toString().padLeft(2, '0');

    return '$minutesString:$secondsString';
  }

  static Future<bool> checkIfIsFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? result = prefs.getBool(ObjectDataKeys.firstTimeUser);
    return result ?? true;
  }

  static setNoLongerAFirstTimeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool(
      ObjectDataKeys.firstTimeUser,
      false,
    );
  }

  static storeANewString(String newString, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      key,
      newString,
    );
  }

  static Future<String> getAStoredString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? result = prefs.getString(key);
    return result ?? '';
  }
}

class ObjectDataKeys {
  static String firstTimeUser = 'firstTimeUser';
  static String businessType = 'businessType';
  static String password = 'userPassword';
  static String pin = 'userPin';
  static String name = 'userFullName';
  static String profilePic = 'profilePic';
}