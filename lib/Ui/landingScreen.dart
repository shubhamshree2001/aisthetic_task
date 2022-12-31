import 'package:aisthetic_task/Ui/landingScreenController.dart';
import 'package:aisthetic_task/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends GetView<LandingScreenController> {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() => LandingWidget()),
    );
  }

  Widget LandingWidget() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(Get.context!).size.height * (0.10),
            padding: const EdgeInsets.fromLTRB(40, 35, 50, 10),
            child: Text(
              'Make it personal',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 15),
                  color: Colors.white),
            ),
          ),
          CarouselWidget(controller.index.value, controller.newIndex),
          const SizedBox(
            height: 30,
          ),
          controller.texts[controller.index.value],
        ],
      ),
    );
  }
}
