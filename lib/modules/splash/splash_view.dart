import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_ui_pages/modules/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "IRD FOUNDATION",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
