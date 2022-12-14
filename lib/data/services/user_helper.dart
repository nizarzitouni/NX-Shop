import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'dart:io' show Platform;

class UserHelper {
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static saveUser(User user) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int buildNumber = int.parse(packageInfo.buildNumber);
    Map<String, dynamic> userData = {
      "name": user.displayName,
      "email": user.email,
      "last_login": user.metadata.lastSignInTime?.millisecondsSinceEpoch,
      "created_at": user.metadata.creationTime?.millisecondsSinceEpoch,
      "role": "user",
      "build_number": buildNumber,
    };

    final userRef = _db.collection('users').doc(user.uid);
    if ((await userRef.get()).exists) {
      await userRef.update({
        "last_login": user.metadata.lastSignInTime?.millisecondsSinceEpoch,
        "build_number": buildNumber,
      });
    } else {
      //save the user data
      await userRef.set(userData);
    }
    await _saveDevice(user);
  }

  static _saveDevice(User user) async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String deviceId = "";
    Map<String, dynamic> deviceData = {};
    if (Platform.isAndroid) {
      final AndroidDeviceInfo deviceInfo = await deviceInfoPlugin.androidInfo;
      deviceId = deviceInfo.id;
      deviceData = {
        "os_version": deviceInfo.version.sdkInt.toString(),
        "platform": "android",
        "model": deviceInfo.model,
        "device": deviceInfo.device,
      };
    }
    if (Platform.isIOS) {
      if (Platform.isAndroid) {
        final IosDeviceInfo deviceInfo = await deviceInfoPlugin.iosInfo;
        deviceId = deviceInfo.identifierForVendor!;
        deviceData = {
          "os_version": deviceInfo.systemVersion,
          "platform": "ios",
          "model": deviceInfo.model,
          "device": deviceInfo.name,
        };
      }
    }
    final nowMs = DateTime.now().millisecondsSinceEpoch;

    final deviceRef = _db
        .collection("users")
        .doc(user.uid)
        .collection("devices")
        .doc(deviceId);
    if ((await deviceRef.get()).exists) {
      await deviceRef.update({
        "updated_at": nowMs,
        "uninstalled": false,
      });
    } else {
      deviceRef.set({
        "created_at": nowMs,
        "updated_at": nowMs,
        "uninstalled": false,
        "id": deviceId,
        "device_info": deviceData,
      });
    }
  }
}
