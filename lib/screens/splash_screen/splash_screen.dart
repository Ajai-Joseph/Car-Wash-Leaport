import 'package:car_wash/controller/splash_controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
          child: Image.asset(
        fit: BoxFit.cover,
        "assets/images/splash_icon.jpg",
      )),
    ));
  }
}
