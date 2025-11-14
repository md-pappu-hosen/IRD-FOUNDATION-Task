import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_ui_pages/routes/app_routes.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
