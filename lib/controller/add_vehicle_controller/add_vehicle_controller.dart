import 'package:car_wash/config/config.dart';
import 'package:car_wash/utils/common_functions/common_loading.dart';
import 'package:get/get.dart';

class AddVehicleController extends GetxController {
  List<SelectedVehicle> selectedVehicles = [];
  String? selectedType;
  String? selectedQuality;

  List<String> vehicleTypes = [
    "Compact Sedan",
    "Full Size Sedan",
    "SUV",
    "Mini-Van"
  ];
  List<String> qualities = ["Silver", "Gold", "Platinum", "Unobtanium"];

  Map<String, Map<String, int>> costs = {
    "Compact Sedan": {
      "Silver": 100,
      "Gold": 150,
      "Platinum": 200,
      "Unobtanium": 250
    },
    "Full Size Sedan": {
      "Silver": 140,
      "Gold": 190,
      "Platinum": 240,
      "Unobtanium": 290
    },
    "SUV": {"Silver": 160, "Gold": 210, "Platinum": 260, "Unobtanium": 310},
    "Mini-Van": {
      "Silver": 200,
      "Gold": 250,
      "Platinum": 300,
      "Unobtanium": 350
    },
  };

  addVehicleToGarage() {
    if (selectedType != null && selectedQuality != null) {
      bool isDuplicate = selectedVehicles.any((vehicle) =>
          vehicle.type == selectedType && vehicle.quality == selectedQuality);

      if (isDuplicate) {
        Get.snackbar(
          "Duplicate Vehicle",
          "The selected vehicle type and quality already exists.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        int cost = costs[selectedType]![selectedQuality]!;
        selectedVehicles
            .add(SelectedVehicle(selectedType!, selectedQuality!, cost));
        update();
      }
    }
  }

  saveVehicles() async {
    if (selectedVehicles.isNotEmpty) {
      try {
        showCommonLoadingDialog();
        for (SelectedVehicle vehicle in selectedVehicles) {
          Map<String, dynamic> vehicleData = {
            "type": vehicle.type,
            "quality": vehicle.quality,
            "cost": vehicle.cost,
            "paid": false
          };
          await appController.firestore
              .collection("users")
              .doc(appController.currentUserModel!.id)
              .collection("garage")
              .add(vehicleData);
        }
        Get.back();
        Get.back();
      } catch (e) {
        Get.back();
        Get.snackbar("Alert!", 'Failed saving vehicles',
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar('No vehicle added', 'Please add your vehicles',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

class SelectedVehicle {
  String type;
  String quality;
  int cost;

  SelectedVehicle(this.type, this.quality, this.cost);
}
