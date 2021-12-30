import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kryptonium/controllers/exchange_controller.dart';
import 'package:kryptonium/widgets/custom_button.dart';

class Exchange extends StatelessWidget {
  final ExchangeController exchangeController = Get.put(ExchangeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        title: const Text('Exchange'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.history,
              color: Get.theme.textSelectionTheme.selectionColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Get.theme.canvasColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    children: [
                      Container(
                        width: Get.size.width * 0.4,
                        height: 60,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Get.theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(24.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 24.0,
                              width: 24.0,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/currencies/lion_icon.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Text('Lion',
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Container(
                        width: Get.size.width * 0.4,
                        height: 60,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Get.theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(24.0)),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Theme.of(context)
                              .textSelectionTheme
                              .selectionColor,
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 16),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: "Enter Amount",
                            errorStyle: TextStyle(
                                color: Theme.of(context).errorColor,
                                fontSize: 12),
                            errorMaxLines: 3,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Get.theme.scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Get.theme.canvasColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    children: [
                      Container(
                        width: Get.size.width * 0.4,
                        height: 60,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Get.theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(24.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 24.0,
                              width: 24.0,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/currencies/eth_icon.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Text('ETH',
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Container(
                        width: Get.size.width * 0.4,
                        height: 60,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Get.theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(24.0)),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Theme.of(context)
                              .textSelectionTheme
                              .selectionColor,
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 16),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: "You will get",
                            errorStyle: TextStyle(
                                color: Theme.of(context).errorColor,
                                fontSize: 12),
                            errorMaxLines: 3,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Get.theme.scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                title: 'Swap',
                color: Get.theme.primaryColor,
                isGradient: true,
                onClick: () {},
              ),
            ))
          ],
        ),
      ),
    );
  }
}
