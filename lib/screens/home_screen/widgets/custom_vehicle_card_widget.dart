import 'package:car_wash/screens/home_screen/widgets/custom_payment_status_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomVehicleCardWidget extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> vehicle;

  const CustomVehicleCardWidget({
    super.key,
    required this.vehicle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          vehicle["type"],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Quality: ${vehicle["quality"]}"),
            Row(
              children: [
                const Text("Payment status: "),
                CustomPaymentStatusWidget(isPaid: vehicle["paid"])
              ],
            ),
          ],
        ),
        trailing: Text("Cost: Rs. ${vehicle["cost"]}"),
      ),
    );
  }
}
