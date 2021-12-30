import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kryptonium/controllers/currency_detail_controller.dart';
import 'package:kryptonium/controllers/home_controller.dart';
import 'package:kryptonium/widgets/custom_gradient_icon.dart';

class CurrencyDetail extends StatelessWidget {
  final CurrencyDetailController currencyDetailController =
      Get.put(CurrencyDetailController());
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        title: const Text('Currency Name'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Get.theme.canvasColor,
        padding: const EdgeInsets.all(24.0),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Container(
                height: 72.0,
                width: 72.0,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image:
                          AssetImage('assets/images/currencies/lion_icon.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Text('\$3,443.23',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Change',
                      style: TextStyle(
                          color: Get.theme.hintColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('+0.64%',
                      style: TextStyle(
                          color: Color(0xFF36FF3E),
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Sparkline(
              data: currencyDetailController.lineData,
              fillMode: FillMode.below,
              lineWidth: 3.0,
              lineColor: Get.theme.primaryColor,
              fillGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Get.theme.primaryColor.withOpacity(0.8),
                  Get.theme.primaryColor.withOpacity(0.6),
                  Get.theme.primaryColor.withOpacity(0.4),
                  Get.theme.primaryColor.withOpacity(0.2)
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('0',
                          style: TextStyle(
                              color: Get.theme.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 24)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('Balance',
                          style: TextStyle(
                              color: Get.theme.hintColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16)),
                    ],
                  ),
                  const VerticalDivider(),
                  Column(
                    children: [
                      Text('\$0.00',
                          style: TextStyle(
                              color:
                                  Get.theme.textSelectionTheme.selectionColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 24)),
                      const SizedBox(height: 8),
                      Text('Value',
                          style: TextStyle(
                              color: Get.theme.hintColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16)),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed('/currency_deposit');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: const Color(0xFF242134),
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Center(
                        child: CustomGradientIcon(
                      Icons.south_west,
                      24.0,
                      LinearGradient(
                        colors: <Color>[
                          Get.theme.primaryColor,
                          Get.theme.colorScheme.secondary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed('/currency_withdraw');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: const Color(0xFF242134),
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Center(
                        child: CustomGradientIcon(
                      Icons.north_east,
                      24.0,
                      LinearGradient(
                        colors: <Color>[
                          Get.theme.primaryColor,
                          Get.theme.colorScheme.secondary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    homeController.selectedNavIndex.value == 1;
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: const Color(0xFF242134),
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Center(
                        child: CustomGradientIcon(
                      Icons.cached,
                      24.0,
                      LinearGradient(
                        colors: <Color>[
                          Get.theme.primaryColor,
                          Get.theme.colorScheme.secondary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ACTIVITY',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('You don’t have any activity yet',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
