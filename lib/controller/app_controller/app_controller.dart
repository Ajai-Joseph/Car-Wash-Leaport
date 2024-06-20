import 'package:car_wash/domain/models/current_user_model/current_user_model.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppController extends GetxController {
  CurrentUserModel? currentUserModel;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}
