//
//
//
//
//
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

const int duration = 2;

enum AuthenticationType {
  emailAndPasswordAuth,
  googleAuth,
  FacebookAuth,
}
