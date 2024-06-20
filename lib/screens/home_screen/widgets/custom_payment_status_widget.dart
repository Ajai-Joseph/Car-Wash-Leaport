import 'package:flutter/material.dart';

class CustomPaymentStatusWidget extends StatelessWidget {
  final bool isPaid;
  const CustomPaymentStatusWidget({super.key, required this.isPaid});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isPaid
              ? Colors.green.withOpacity(0.3)
              : Colors.red.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Text(
        isPaid ? 'Paid' : 'Not Paid',
        style: TextStyle(
            color: isPaid ? Colors.green : Colors.red,
            fontWeight: FontWeight.w900,
            fontSize: 10),
      ),
    );
  }
}
