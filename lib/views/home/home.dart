import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kryptonium/widgets/custom_rectangle.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40.0, bottom: 40),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Get.theme.primaryColor),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Text("\$3,443.23",
                      style: TextStyle(
                          color: Get.theme.textSelectionTheme.selectionColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 32)),
                  alignment: Alignment.center,
                  width: 256,
                  height: 147,
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                listItem('Lion', '0.00', '\$4,634.21', '+0.64%',
                    'assets/images/currencies/lion_icon.png'),
                listItem('ETH', '0.00', '\$4,634.21', '+0.64%',
                    'assets/images/currencies/eth_icon.png'),
                listItem('BSC', '0.00', '\$4,634.21', '+0.64%',
                    'assets/images/currencies/bsc_icon.png'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget listItem(String name, String balance, String usdBalance,
      String marketRate, String img) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          Get.toNamed('/currency_detail');
        },
        child: Container(
            decoration: BoxDecoration(
              color: Get.theme.canvasColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  height: 36.0,
                  width: 36.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(50)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              balance,
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Divider(
                          color: Get.theme.highlightColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              usdBalance,
                              style: const TextStyle(fontSize: 10),
                            ),
                            Text(
                              marketRate,
                              style: const TextStyle(
                                  fontSize: 10, color: Color(0xFF36FF3E)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
