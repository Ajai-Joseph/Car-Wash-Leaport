import 'dart:convert';
import 'dart:developer';

import 'package:car_wash/config/config.dart';
import 'package:car_wash/config/routes/index.dart';
import 'package:car_wash/domain/models/current_user_model/current_user_model.dart';
import 'package:car_wash/utils/common_functions/common_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText = true;

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    }

    return null;
  }

  togglePasswordVisibility() {
    obscureText = !obscureText;
    update();
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      try {
      showCommonLoadingDialog();
      UserCredential userCredential = await appController.firebaseAuth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      if (userCredential.user != null) {
        DocumentSnapshot<Map<String, dynamic>> userDetails = await appController
            .firestore
            .collection("users")
            .doc(userCredential.user!.uid)
            .get();

        SharedPreferences preferences = await SharedPreferences.getInstance();
        CurrentUserModel currentUserModel = CurrentUserModel(
            id: userCredential.user!.uid,
            name: userDetails.data()!['name'],
            email: userDetails.data()!['email'],
            walletBalance: userDetails.data()!['walletBalance']);
        appController.currentUserModel = currentUserModel;
        await preferences.setString(stringConstants.currentUserSaveKeyName,
            jsonEncode(currentUserModel));
        Get.snackbar('Login successful', 'You have logged in successfully',
            snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed(routeName.homeScreen);
      }
      } catch (e) {
        log(e.toString());
        Get.back();
        Get.snackbar("Alert!", 'Login failed',
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }
}
