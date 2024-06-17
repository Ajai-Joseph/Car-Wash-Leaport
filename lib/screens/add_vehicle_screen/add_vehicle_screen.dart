import 'package:car_wash/controller/add_vehicle_controller/add_vehicle_controller.dart';
import 'package:car_wash/controller/garage_controller/garage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddVehicleScreen extends GetWidget<AddVehicleController> {
  AddVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Vehicles")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Vehicle Type"),
              value: controller.selectedType,
              items: controller.vehicleTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                controller.selectedType = value;
              },
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Quality"),
              value: controller.selectedQuality,
              items: controller.qualities.map((quality) {
                return DropdownMenuItem(
                  value: quality,
                  child: Text(quality),
                );
              }).toList(),
              onChanged: (value) {
                controller.selectedQuality = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.addVehicleToGarage();
              },
              child: Text("Add Vehicle"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GetBuilder<AddVehicleController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.selectedVehicles.length,
                  itemBuilder: (context, index) {
                    SelectedVehicle vehicle =
                        controller.selectedVehicles[index];
                    return ListTile(
                      title: Text(vehicle.type),
                      subtitle: Text("Quality: ${vehicle.quality}"),
                      trailing: Text("Cost: Rs. ${vehicle.cost}"),
                    );
                  },
                );
              }),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                controller.saveVehicles();
              },
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Save Vehicles",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
