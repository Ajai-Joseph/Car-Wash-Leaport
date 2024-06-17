// import 'package:car_wash/controller/app_controller/app_controller.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class GarageController extends GetxController {
//   var vehicles = [].obs;
//   var selectedVehicle = {}.obs;
//   var walletBalance = 500.obs;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final AuthController authController = Get.find();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchVehicles();
//   }

//   void fetchVehicles() async {
//     var user = authController.firebaseUser.value;
//     if (user != null) {
//       var snapshot = await firestore
//           .collection("users")
//           .doc(user.uid)
//           .collection("garage")
//           .get();
//       vehicles.value = snapshot.docs.map((doc) => doc.data()).toList();
//     }
//   }

//   void addVehicle(Map<String, dynamic> vehicle) async {
//     var user = authController.firebaseUser.value;
//     if (user != null) {
//       await firestore
//           .collection("users")
//           .doc(user.uid)
//           .collection("garage")
//           .add(vehicle);
//       fetchVehicles();
//     }
//   }

//   void setSelectedVehicle(Map<String, dynamic> vehicle) {
//     selectedVehicle.value = vehicle;
//   }

//   void deductFromWallet(int amount) {
//     walletBalance.value -= amount;
//     var user = authController.firebaseUser.value;
//     if (user != null) {
//       firestore.collection("users").doc(user.uid).update({
//         "walletBalance": walletBalance.value,
//       });
//     }
//   }
// }
