
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;

  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2021/05/09/12/48/maid-6240794_1280.jpg',
    'https://cdn.pixabay.com/photo/2024/05/24/20/40/cooking-8785748_1280.jpg',
    'https://cdn.pixabay.com/photo/2022/05/10/06/34/baby-photoshoot-7186087_1280.jpg',
  ];

  void updatePageIndex(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < imageUrls.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to next screen
    }
  }

  void skipToLast() {
    pageController.animateToPage(
      imageUrls.length - 1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}