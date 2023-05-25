import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_constants.dart';

class LocalStorageHelper {
  static Future<bool> setItem(String key, String val) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, val);
    return true;
  }

  static getItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final String? val = prefs.getString(key);
    return val;
  }

  static removeItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    debugPrint('Removed Item Successfully');
  }

  static Future<void> storeCreatedDatabasePath(
      {required String pathOfTheDatabase}) async {
    bool saved = await setItem(
        LocalStorageConstants.pathOfTheDatabase, pathOfTheDatabase);
    if (saved) {
      debugPrint('Path is saved to the shared preference');
    } else {
      debugPrint(
          'Something went wrong while saving path to the shared preference');
    }
  }

  static Future<String?> getStoredPathOfTheDatabase() async {
    var pathOfTheDatabase =
        await getItem(LocalStorageConstants.pathOfTheDatabase);
    if (pathOfTheDatabase == null || pathOfTheDatabase.isEmpty) {
      debugPrint('Path did not found in the shared preferences');
      return null;
    } else {
      debugPrint(
          'Database path is founded at from the shared preference --- $pathOfTheDatabase');
      return pathOfTheDatabase;
    }
  }

  static Future<void> saveLoggedInUserIdToLocalStorage({
    required String userId,
  }) async {
    await setItem(LocalStorageConstants.firebaseUserId, userId);
    debugPrint('Firebase user successfully saved to the local storage');
  }

  static Future<String> getStoredFirebaseUserIdFromTheLocalStorage() async {
    final firebaseUserId = await getItem(LocalStorageConstants.firebaseUserId);
    return firebaseUserId;
  }
}
