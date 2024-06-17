import 'package:car_wash/domain/models/current_user_model/current_user_model.dart';
import 'package:car_wash/screens/home_screen/home_screen.dart';
import 'package:car_wash/screens/login_screen/login_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppController extends GetxController {
  CurrentUserModel? currentUserModel;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}
