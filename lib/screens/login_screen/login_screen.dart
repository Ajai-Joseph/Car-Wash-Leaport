import 'package:car_wash/config/routes/index.dart';
import 'package:car_wash/controller/app_controller/app_controller.dart';
import 'package:car_wash/controller/login_controller/login_controller.dart';
import 'package:car_wash/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: controller.validateEmail,
              ),
              SizedBox(height: 20),
              GetBuilder<LoginController>(builder: (controller) {
                return TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.togglePasswordVisibility();
                      },
                      icon: Icon(
                        controller.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color.fromARGB(255, 1, 66, 119),
                      ),
                    ),
                  ),
                  obscureText: controller.obscureText,
                  validator: controller.validatePassword,
                );
              }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: Text("Login"),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.toNamed(routeName.registerScreen);
                },
                child: Text("Don't have an account? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
