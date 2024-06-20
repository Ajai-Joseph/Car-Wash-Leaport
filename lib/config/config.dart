import 'package:car_wash/controller/app_controller/app_controller.dart';
import 'package:car_wash/utils/constants/string_constants/string_constants.dart';
import 'package:get/get.dart';

StringConstants stringConstants = StringConstants();

AppController appController = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());
