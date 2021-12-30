import 'package:kryptonium/constants/storage_constants.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    startTime();
    super.onInit();
  }

  startTime() async {
    return Timer(const Duration(milliseconds: 3600), routeUser);
  }

  void routeUser() async {
    final isLoggedIn = GetStorage().read(StorageConstants.loggedIn);
    final seenIntro = GetStorage().read(StorageConstants.seenIntro);
    GetStorage().remove(StorageConstants.loggedIn);
    if (isLoggedIn == null || !isLoggedIn) {
      Get.offNamed(seenIntro != null && seenIntro ? '/auth_home' : '/intro');
    } else {
      Get.offNamed(seenIntro != null && seenIntro ? '/home' : '/intro');
    }
  }

  @override
  void onClose() {}
}
