import 'package:car_wash/controller/register_controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: controller.validateName,
              ),
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: controller.validateEmail,
              ),
              GetBuilder<RegisterController>(builder: (controller) {
                return TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.togglePasswordVisibility();
                      },
                      icon: Icon(
                        controller.showPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: controller.showPassword,
                  validator: controller.validatePassword,
                );
              }),
              GetBuilder<RegisterController>(builder: (controller) {
                return TextFormField(
                    controller: controller.confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.toggleConfirmPasswordVisibility();
                        },
                        icon: Icon(
                          controller.showConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: controller.showConfirmPassword,
                    validator: controller.validateConfirmPassword);
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.registerUser();
                },
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
