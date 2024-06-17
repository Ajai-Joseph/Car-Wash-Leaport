import 'package:car_wash/config/bindings/add_vehicle_binding.dart';
import 'package:car_wash/config/bindings/home_binding.dart';
import 'package:car_wash/config/bindings/login_binding.dart';
import 'package:car_wash/config/bindings/payment_binding.dart';
import 'package:car_wash/config/bindings/register_binding.dart';
import 'package:car_wash/config/bindings/splash_binding.dart';
import 'package:car_wash/config/routes/index.dart';
import 'package:car_wash/screens/add_vehicle_screen/add_vehicle_screen.dart';
import 'package:car_wash/screens/home_screen/home_screen.dart';
import 'package:car_wash/screens/login_screen/login_screen.dart';
import 'package:car_wash/screens/payment_screen/payment_screen.dart';
import 'package:car_wash/screens/register_screen/register_screen.dart';
import 'package:car_wash/screens/splash_screen/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(
        name: routeName.splashScreen,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: routeName.loginScreen,
        page: () => LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: routeName.homeScreen,
        page: () => HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: routeName.registerScreen,
        page: () => RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: routeName.addVehicleScreen,
        page: () => AddVehicleScreen(),
        binding: AddVehicleBinding()),
    GetPage(
        name: routeName.paymentScreen,
        page: () => PaymentScreen(),
        binding: PaymentBinding()),
  ];
}
