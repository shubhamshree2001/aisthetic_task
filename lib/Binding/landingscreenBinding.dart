import 'package:aisthetic_task/Ui/landingScreenController.dart';
import 'package:get/get.dart';

class LandingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LandingScreenController());
  }
}
