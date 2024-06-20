import 'package:car_wash/config/config.dart';
import 'package:car_wash/controller/payment_controller/payment_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends GetWidget<PaymentController> {
  PaymentScreen({
    super.key,
  });
  final QueryDocumentSnapshot<Map<String, dynamic>> vehicle = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Proceed to pay for the vehicle:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "Vehicle: ${vehicle["type"]}",
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 5),
              Text(
                "Quality: ${vehicle["quality"]}",
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 5),
              Text(
                "Cost: Rs. ${vehicle["cost"]}",
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 15),
              Text(
                "Wallet Balance: Rs. ${appController.currentUserModel!.walletBalance}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          controller.makePayment(vehicle["cost"],
              appController.currentUserModel!.walletBalance!, vehicle.id);
        },
        child: Container(
            margin: const EdgeInsets.all(15),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(10)),
            child: const Center(
                child: Text(
              "Pay Now",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ))),
      ),
    );
  }
}
