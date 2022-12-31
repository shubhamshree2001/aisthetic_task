import 'package:aisthetic_task/Binding/landingscreenBinding.dart';
import 'package:aisthetic_task/Ui/landingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.landingScreen,
      page: () => const LandingScreen(),
      binding: LandingScreenBinding(),
    )
  ];
}
