import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kryptonium/constants/storage_constants.dart';
import 'package:kryptonium/controllers/intro_wizard_controller.dart';
import 'package:kryptonium/views/intro/intro.dart';
import 'package:kryptonium/widgets/custom_button.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class IntroWizard extends StatelessWidget {
  final IntroWizardController controller = Get.put(IntroWizardController());
  final _title = [
    'Receive'.tr,
    'Send'.tr,
    'Exchange'.tr,
    'Get Rewarded!'.tr,
  ];

  final _description = [
    'Receive crypto by scanning or sharing your unique QR code or address'.tr,
    'Send  crypto in aa few taps by scanning a or pasting an address'.tr,
    'Instantly swap your crypto with75+ other assets securely from your wallet'
        .tr,
    'Your receive Krytonium for each transaction'.tr,
  ];

  final _assetImages = [
    'assets/images/on_boarding.png',
    'assets/images/on_boarding.png',
    'assets/images/on_boarding.png',
    'assets/images/on_boarding.png',
    'assets/images/on_boarding.png',
    'assets/images/on_boarding.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        return Column(
          children: [
            // GestureDetector(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 25),
            //     child: Align(
            //       alignment: Alignment.topRight,
            //       child: Text(
            //         'skip_all'.tr,
            //         // style: Themes.smallTextStyle,
            //       ),
            //     ),
            //   ),
            //   onTap: () {
            //     // GetStorage().write(StorageConstants.skipIntro, true);
            //     // Get.offNamed('/dashboard');
            //     controller.currentPageNotifier.value.value =
            //         controller.wizardsCount.value - 1;
            //     controller.pageController.value.animateToPage(
            //         controller.wizardsCount.value - 1,
            //         duration: Duration(milliseconds: 500),
            //         curve: Curves.easeOut);
            //     controller.currentPageNotifier.refresh();
            //     controller.pageController.refresh();
            //   },
            // ),
            Expanded(
              child: PageView.builder(
                itemCount: controller.wizardsCount.value,
                itemBuilder: (context, index) => Introduction(
                  title: _title[index],
                  description: _description[index],
                  imagePath: _assetImages[index],
                ),
                onPageChanged: (index) {
                  controller.currentPageNotifier.value.value = index;
                  controller.currentPageNotifier.refresh();
                },
                controller: controller.pageController.value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Align(
                child: CirclePageIndicator(
                  itemCount: _title.length,
                  dotColor: Get.theme.hintColor,
                  currentPageNotifier: controller.currentPageNotifier.value,
                  selectedDotColor: Get.theme.textSelectionTheme.selectionColor,
                  selectedSize: 10,
                  size: 10,
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: CustomButton(
                onClick: () {
                  if (controller.currentPageNotifier.value.value <
                      controller.wizardsCount.value - 1) {
                    controller.pageController.value.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut);
                  } else {
                    GetStorage().write(StorageConstants.seenIntro, true);
                    Get.offNamed('/auth_home');
                  }
                },
                title: controller.currentPageNotifier.value.value ==
                        controller.wizardsCount.value - 1
                    ? 'Get Started'
                    : 'Next',
                color: Get.theme.primaryColor,
                isGradient: true,
              ),
            ),
            const SizedBox(
              height: 24,
            )
          ],
        );
      }),
    );
  }
}
