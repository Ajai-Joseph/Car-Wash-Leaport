import 'package:car_wash/config/config.dart';
import 'package:car_wash/utils/common_functions/common_loading.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  makePayment(int cost, int walletBalance, String vehicleId) async {
    if (cost <= walletBalance) {
      try {
        showCommonLoadingDialog();
        walletBalance = walletBalance - cost;
        await appController.firestore
            .collection("users")
            .doc(appController.currentUserModel!.id)
            .update({
          "walletBalance": walletBalance,
        });
        await appController.firestore
            .collection("users")
            .doc(appController.currentUserModel!.id)
            .collection('garage')
            .doc(vehicleId)
            .update({
          "paid": true,
        });
        appController.currentUserModel!.walletBalance =
            appController.currentUserModel!.walletBalance! - cost;
        Get.back();
        Get.back();
        Get.snackbar("Payment Successful", "Amount deducted: Rs. $cost",
            snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        Get.back();
        Get.snackbar("Payment Failed", "Something went wrong",
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar("Payment Failed", "Insufficient balance",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
