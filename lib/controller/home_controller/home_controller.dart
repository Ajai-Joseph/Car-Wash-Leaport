import 'package:car_wash/config/config.dart';
import 'package:car_wash/config/routes/index.dart';
import 'package:car_wash/utils/common_functions/common_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  navigateToAddVehiclePage() {
    Get.toNamed(routeName.addVehicleScreen);
  }

  navigateToPaymentPage(vehicle) {
    if (vehicle['paid'] == true) {
      Get.snackbar("Already paid!", 'You have already paid for this car wash!',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.toNamed(routeName.paymentScreen, arguments: vehicle);
    }
  }

  showWallet() {
    Get.dialog(
      Center(
        child: Dialog(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Your Wallet Balance:',
                  style: TextStyle(
                    //color: Colors.purple,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                'Rs. ${appController.currentUserModel!.walletBalance}',
                style: const TextStyle(
                  color: Colors.purple,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 0.5,
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: const Center(
                    child: Text(
                      'Go Back',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  logout() async {
    showCommonLoadingDialog();
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      appController.currentUserModel = null;
      await appController.firebaseAuth.signOut();
      Get.snackbar("Success!", 'Logout successfully',
          snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed(routeName.loginScreen);
    } catch (e) {
      Get.back();
      Get.snackbar("Alert!", 'Logout failed',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
