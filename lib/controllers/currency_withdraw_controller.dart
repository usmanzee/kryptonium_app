import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CurrencyWithdrawController extends GetxController {
  TextEditingController amountTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    amountTextController.dispose();
    addressTextController.dispose();
    super.onClose();
  }
}
