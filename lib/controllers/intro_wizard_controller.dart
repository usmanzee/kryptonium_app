import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroWizardController extends GetxController {
  var wizardsCount = 4.obs;
  var currentPageNotifier = ValueNotifier<int>(0).obs;
  var pageController = PageController().obs;

  final wizardData = [
    {
      'title': 'Receive',
      'description':
          'Receive crypto by scanning or sharing your unique QR code or address',
      'imagePath': 'assets/images/on_boarding.png'
    },
    {
      'title': 'Send',
      'description':
          'Send  crypto in aa few taps by scanning a or pasting an address',
      'imagePath': 'assets/images/on_boarding.png'
    },
    {
      'title': 'Exchange',
      'description':
          'Instantly swap your crypto with 75+ other assets securely from your wallet',
      'imagePath': 'assets/images/on_boarding.png'
    },
    {
      'title': 'Get Rewarded!',
      'description': 'Your receive Krytonium for each transaction',
      'imagePath': 'assets/images/on_boarding.png'
    },
  ];
}
