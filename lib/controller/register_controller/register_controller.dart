import 'dart:developer';

import 'package:car_wash/config/config.dart';
import 'package:car_wash/config/routes/index.dart';
import 'package:car_wash/utils/common_functions/common_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool showConfirmPassword = false;

  togglePasswordVisibility() {
    showPassword = !showPassword;
    update();
  }

  toggleConfirmPasswordVisibility() {
    showConfirmPassword = !showConfirmPassword;
    update();
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
    }

    return null;
  }

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
    } else if (value.length < 6) {
      return "Password should be at least 6 characters";
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    } else if (value != passwordController.text) {
      return 'Password do not match';
    }
    return null;
  }

  void registerUser() async {
    if (formKey.currentState!.validate()) {
      try {
        showCommonLoadingDialog();
        UserCredential userCredential =
            await appController.firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        await appController.firestore
            .collection('users')
            .doc(userCredential.user?.uid)
            .set({
          'name': nameController.text,
          'email': emailController.text,
          'walletBalance': 10000,
        });

        Get.snackbar("Success", "Account created successfully",
            snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed(routeName.loginScreen);
      } catch (e) {
        log(e.toString());
        Get.back();
        Get.snackbar("Error", e.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }
}
