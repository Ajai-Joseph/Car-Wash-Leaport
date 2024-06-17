import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:car_wash/config/config.dart';
import 'package:car_wash/config/routes/index.dart';
import 'package:car_wash/controller/app_controller/app_controller.dart';
import 'package:car_wash/domain/models/current_user_model/current_user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  startTimer() async {
    return Timer(const Duration(seconds: 3), navigationPage);
  }

  void navigationPage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? currentUser =
        preferences.getString(stringConstants.currentUserSaveKeyName);
    if (currentUser != null) {
      appController.currentUserModel =
          CurrentUserModel.fromJson(jsonDecode(currentUser));
      Get.offAllNamed(routeName.homeScreen);
    } else {
      Get.offAllNamed(routeName.loginScreen);
    }
  }
}
