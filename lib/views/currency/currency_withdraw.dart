import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kryptonium/controllers/currency_withdraw_controller.dart';
import 'package:kryptonium/widgets/custom_button.dart';
import 'package:kryptonium/widgets/customer_text_field.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CurrencyWithdraw extends StatelessWidget {
  final CurrencyWithdrawController currencyWithdrawController =
      Get.put(CurrencyWithdrawController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        title: const Text('Currency Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              height: 72.0,
              width: 72.0,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/currencies/lion_icon.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Balance',
                  style: TextStyle(color: Get.theme.hintColor, fontSize: 18),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  '0.00',
                  style: TextStyle(fontSize: 56.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Network fee:',
                  style: TextStyle(color: Get.theme.hintColor, fontSize: 18),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  '0.00%',
                  style: TextStyle(color: Get.theme.hintColor, fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: currencyWithdrawController.amountTextController,
                  labelText: 'Amount'.tr,
                  fieldValidator: (value) {},
                  password: false,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  fillColor: Get.theme.canvasColor,
                  filled: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  controller: currencyWithdrawController.amountTextController,
                  labelText: 'Address'.tr,
                  fieldValidator: (value) {},
                  password: false,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  fillColor: Get.theme.canvasColor,
                  filled: true,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.qr_code_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                onClick: () {},
                title: 'Send',
                color: Get.theme.canvasColor,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
