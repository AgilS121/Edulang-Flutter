
import 'package:edulang/models/IntroModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IntroController extends GetxController {
  var currentIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void nextPage(List<IntroModel> screens) {
    if (currentIndex.value == screens.length - 1) {
      // You can perform actions when reaching the last page
    }

    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  void skipIntro() async {
    // Perform actions when skipping intro
    GetStorage storage = GetStorage();

    // Perform actions when skipping intro
    int isViewed = 0;
    await storage.write('intro', isViewed);

    Get.offAllNamed('/login');
  }
}
