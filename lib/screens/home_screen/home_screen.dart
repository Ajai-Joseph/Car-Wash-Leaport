import 'package:car_wash/config/config.dart';
import 'package:car_wash/controller/app_controller/app_controller.dart';
import 'package:car_wash/controller/garage_controller/garage_controller.dart';
import 'package:car_wash/controller/home_controller/home_controller.dart';
import 'package:car_wash/screens/add_vehicle_screen/add_vehicle_screen.dart';
import 'package:car_wash/screens/home_screen/widgets/custom_payment_status_widget.dart';
import 'package:car_wash/screens/home_screen/widgets/custom_vehicle_card_widget.dart';
import 'package:car_wash/screens/payment_screen/payment_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'logout') {
                controller.logout();
              } else if (value == 'wallet') {
                controller.showWallet();
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'wallet',
                  child: const Text('Wallet'),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  child: const Text('Logout'),
                )
              ];
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
                    stream: appController.firestore
                        .collection("users")
                        .doc(appController.currentUserModel!.id)
                        .collection("garage")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          if (snapshot.data!.docs.isNotEmpty) {
                            return ListView.separated(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                QueryDocumentSnapshot<Map<String, dynamic>>
                                    vehicle = snapshot.data!.docs[index];
                                return InkWell(
                                    onTap: () {
                                      controller.navigateToPaymentPage(vehicle);
                                    },
                                    child: CustomVehicleCardWidget(
                                        vehicle: vehicle));
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 15);
                              },
                            );
                          }
                        }
                        return Center(
                          child: Text('No vehicles added'),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Something went wrong'),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToAddVehiclePage,
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
