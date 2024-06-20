import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCommonLoadingDialog() {
  Get.dialog(
    const Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(
              strokeWidth: 6,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Please wait...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}
