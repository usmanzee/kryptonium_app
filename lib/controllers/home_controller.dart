import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedNavIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeTabIndex(int index) {
    selectedNavIndex.value = index;
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
