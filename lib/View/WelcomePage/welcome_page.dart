import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/WelcomePageController/welcome_page_controller.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: controller.imageUrls.length,
              controller: controller.pageController,  // Use the controller from OnboardingController
              onPageChanged: controller.updatePageIndex,
              itemBuilder: (context, index) {
                return Image.network(
                  controller.imageUrls[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.4, // Adjust height as needed
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.0),
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Obx(() => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        controller.imageUrls.length,
                            (index) => Container(
                          width: 12,
                          height: 12,
                          margin: EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: controller.currentPage.value == index
                                ? Colors.green
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    )),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Quality Service',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Get quality and professional service right to your doorsteps.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => controller.nextPage(),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.all(16),
                        ),
                        child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () => controller.skipToLast(),
                        child: Text(
                          'Skip',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}