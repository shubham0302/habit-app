// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:habbit_app/screens/helpers/local_storage_helper.dart';
import 'package:habbit_app/screens/pin/lock_pin_dailbox.dart';
import 'package:local_auth/local_auth.dart';

class LockPinController extends GetxController {
  TextEditingController pinSetCtrl = TextEditingController();
  RxString setpin = "".obs;
  TextEditingController pinconfirmCtrl = TextEditingController();
  RxString confirmpin = "".obs;
  TextEditingController pinCtrl = TextEditingController();
  RxString pin = "".obs;

  RxString lockType = "none".obs;

  changeType(String val) async {
    lockType.value = val;
    await LocalStorageHelper.setItem('lock_type', val);
  }

  checkBioPermissions() async {
    LocalAuthentication auth = LocalAuthentication();
    var canAuthBio = await auth.canCheckBiometrics;

    var canCheck = canAuthBio || await auth.isDeviceSupported();

    List<BiometricType> data = await auth.getAvailableBiometrics();

    if (data.isNotEmpty &&
        (data.contains(BiometricType.face) ||
            data.contains(BiometricType.strong) ||
            data.contains(BiometricType.fingerprint))) {
      await changeType('bio');
    } else {
      print('hahaha not supported');
    }
  }

  changeTypeFromScreen(String val, BuildContext context) async {
    if (lockType.value != val) {
      switch (val) {
        case 'bio':
          if (lockType.value != 'pin') {
            print('le');
          } else {
            await checkBioPermissions();
          }
          break;
        case 'pin':
          LockPinCustomDialogBox(context);
          break;
        default:
          await changeType('none');
          break;
      }
      // if (lockType.value != 'pin' && val == 'bio') {
      //   if (val != 'bio') {
      //     if(val=='pin'){

      //     }else{
      //       lockType.value = val;
      //     }
      //   } else {
      //     print('le');
      //   }
      // } else {
      //   lockType.value = val;
      // }
    }
  }

  authenticate() async {
    try {
      LocalAuthentication auth = LocalAuthentication();
      // var canAuthenticate = await auth
      var done = await auth.authenticate(
          localizedReason: 'Please authenticate to go to your app',
          options: const AuthenticationOptions(biometricOnly: true));
      if (done) {
        Get.offAllNamed('/intro');
      } else {
        print('skc');
      }
    } on PlatformException catch (e) {
      print(e.details);
    } catch (e) {
      print(e);
    }
  }

  void addPin() async {
    if (setpin == confirmpin) {
      await LocalStorageHelper.setItem("pin", setpin.value);
      await changeType('pin');
    }
  }

  void verify() async {
    if (lockType.value != 'bio') {
      var pind = await LocalStorageHelper.getItem('pin');
      if (pin.value == pind) {
        Get.offAllNamed('/intro');
      } else {
        print('le');
      }
    } else {
      await authenticate();
    }
  }

  void onSubmitverify(String e) async {
    pin.value = e;
    // if (lockType.value == 'bio') {
    if (e.split('').length == 4) {
      var pind = await LocalStorageHelper.getItem('pin');
      if (pin.value == pind) {
        Get.offAllNamed('/intro');
      } else {
        print('le');
      }
    }
    // } else {
    //   await authenticate();
    // }
  }

  getPinType() async {
    var pin = await LocalStorageHelper.getItem('lock_type');
    lockType.value = ['none', 'pin', 'bio'].contains(pin) ? pin : 'none';
    if (lockType.value == 'pin' || lockType.value == 'bio') {
      Get.offAllNamed('/pin');
      if (lockType.value == 'bio') {
        await authenticate();
      }
    } else {
      Get.offAllNamed('/intro');
    }
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    getPinType();

    super.onInit();
  }
}
