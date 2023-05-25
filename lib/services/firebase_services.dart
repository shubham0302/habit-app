// ignore_for_file: avoid_print

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:habbit_app/controllers/premium_controller.dart';
import 'package:habbit_app/helpers/local_storage_helper.dart';
import 'package:habbit_app/utilities/file_utils.dart';

class FirerbaseServices {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  PremiumController premiumController = Get.find<PremiumController>();

  Future<void> signInWithGoggle({
    required BuildContext context,
  }) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        final result = await auth.signInWithCredential(authCredential);
        User? user = result.user;
        if (user != null) {
          debugPrint('Sign-in successful\nUser name == ${user.displayName}');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Login successful',
              ),
            ),
          );
          await LocalStorageHelper.saveLoggedInUserIdToLocalStorage(
              userId: user.uid);
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
  }

  logOut() async {
    await auth.signOut();
    await googleSignIn.disconnect();
  }

  Future<bool> saveBackUpToTheFirebase({
    required String fileName,
    required File backupFile,
  }) async {
    var uploaded = false;
    try {
      final userId =
          await LocalStorageHelper.getStoredFirebaseUserIdFromTheLocalStorage();
      debugPrint('User Id from the local storage = $userId');
      Reference storageReference = FirebaseStorage.instance.ref().child(userId);
      UploadTask uploadTask =
          storageReference.child(fileName).putFile(backupFile);
      await uploadTask.whenComplete(() {
        debugPrint('File uploaded successfully to the firebase');
        uploaded = true;
      });
    } catch (e) {
      debugPrint(
          'Something went wrong while uploading the file to the firebase, Please try again');
      debugPrint(e.toString());
      uploaded = false;
    }
    return uploaded;
  }

  Future<bool> getBackUpFromTheFirebase() async {
    bool downloaded = false;
    try {
      final userId =
          await LocalStorageHelper.getStoredFirebaseUserIdFromTheLocalStorage();

      Reference reference = FirebaseStorage.instance
          .ref()
          .child(userId)
          .child('habbit_app_database.sqlite');
      String filePath = await reference.getDownloadURL();
      var downloadsFolder = await getDownloadsDirectoryToSaveData();
      debugPrint('Download URL ===== $filePath');

      String fileName = 'habbit_app_database.sqlite';
      String fullPath = '${downloadsFolder!.path}/$fileName';

      File file = File(fullPath);
      try {
        await reference.writeToFile(file);
        downloaded = true;
        debugPrint('File downloaded successfully.');
      } catch (e) {
        downloaded = true;
        debugPrint(
            'Something went wrong while writing the file-- ${e.toString()}');
      }
    } catch (e) {
      downloaded = true;
      debugPrint('Something went wrong while fetching the back-ups');
      debugPrint(e.toString());
    }
    return downloaded;
  }
}

class SecureStorage {
  final storage = FlutterSecureStorage();

  //Save Credentials
  Future saveCredentials(AccessToken token, String refreshToken) async {
    print(token.expiry.toIso8601String());
    await storage.write(key: "type", value: token.type);
    await storage.write(key: "data", value: token.data);
    await storage.write(key: "expiry", value: token.expiry.toString());
    await storage.write(key: "refreshToken", value: refreshToken);
  }

  //Get Saved Credentials
  Future<Map<String, dynamic>?> getCredentials() async {
    var result = await storage.readAll();
    if (result.isEmpty) return null;
    return result;
  }

  //Clear Saved Credentials
  Future clear() {
    return storage.deleteAll();
  }
}
