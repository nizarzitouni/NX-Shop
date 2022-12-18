import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Utility {
  static Image imageFromBase64String(
      {required String base64String,
      required imageWidth,
      required imageHeight}) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
      width: imageWidth,
      height: imageHeight,
    );
  }

  static Uint8List imageFromBase64StringToUint8List(String base64String) {
    return Uint8List.fromList(base64Decode(base64String));
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
