import 'package:flutter/material.dart';
import 'Routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.landingScreen,
      getPages: AppPages.pages,
      builder: EasyLoading.init(),
    );
  }
}
