import 'package:car_wash/config/routes/index.dart';
import 'package:car_wash/controller/login_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: controller.validateEmail,
              ),
              const SizedBox(height: 20),
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
                        color: const Color.fromARGB(255, 1, 66, 119),
                      ),
                    ),
                  ),
                  obscureText: controller.obscureText,
                  validator: controller.validatePassword,
                );
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: const Text("Login"),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.toNamed(routeName.registerScreen);
                },
                child: const Text("Don't have an account? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
