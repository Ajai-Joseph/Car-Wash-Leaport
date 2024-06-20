import 'package:car_wash/config/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyCTwhpCUzdVrObdnBEeJxOPtUgbeTnVP-A',
    appId: '1:585486069052:android:87e211c439202c12910239',
    messagingSenderId: '585486069052',
    projectId: 'car-wash-app-leaport',
    storageBucket: 'car-wash-app-leaport.appspot.com',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Car Wash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: routeName.splashScreen,
      getPages: appRoute.getPages,
    );
  }
}
