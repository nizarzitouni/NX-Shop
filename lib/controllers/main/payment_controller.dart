import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../core/my_colors.dart';

class PaymentController extends GetxController {
  var langitude = ''.obs;
  var latitude = ''.obs;
  var address = 'Your Adresse'.obs;
  var phoneNumber = ''.obs;

  // void removeGooglePay() {}

  // void makeGooglePay({required String amount, required label}) {}
  //
  Future<void> updatePosition() async {
    Position position = await _determinePosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];
    address.value =
        "${place.administrativeArea},${place.name},\n${place.street}";
    // print(place);
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Get.snackbar(
        'Error!',
        'Please enable the location services.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyColors.myRed,
        colorText: MyColors.myWhite,
        borderRadius: 15,
        margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
        duration: const Duration(seconds: 2),
      );
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Get.snackbar(
          'Error!',
          'You Must Accept the acc to your location.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: MyColors.myRed,
          colorText: MyColors.myWhite,
          borderRadius: 15,
          margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
          forwardAnimationCurve: Curves.elasticInOut,
          reverseAnimationCurve: Curves.easeOut,
          duration: const Duration(seconds: 2),
        );
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.snackbar(
        'Error!',
        'Location permissions are permanently denied, we cannot request permissions.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyColors.myRed,
        colorText: MyColors.myWhite,
        borderRadius: 16,
        margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
        duration: const Duration(seconds: 2),
      );
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
