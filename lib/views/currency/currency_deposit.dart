import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kryptonium/controllers/currency_deposit_controller.dart';
import 'package:kryptonium/widgets/custom_button.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CurrencyDeposit extends StatelessWidget {
  final CurrencyDepositController currencyDepositController =
      Get.put(CurrencyDepositController());

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
            child: QrImage(
              data: "1234567890",
              version: QrVersions.auto,
              size: 200.0,
              backgroundColor: Get.theme.textSelectionTheme.selectionColor!,
              // foregroundColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Text(
                  'Your BTC address',
                  style: TextStyle(color: Get.theme.hintColor, fontSize: 18),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  '12v3423VY3JBsdnsdf347778jG&fnw',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Get.theme.canvasColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.content_copy,
                      color: Get.theme.primaryColor,
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
                title: 'Share',
                color: Get.theme.canvasColor,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
