import 'package:car_wash/controller/add_vehicle_controller/add_vehicle_controller.dart';
import 'package:get/get.dart';

class AddVehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddVehicleController());
  }
}
