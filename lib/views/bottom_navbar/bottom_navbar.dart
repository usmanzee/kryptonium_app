import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kryptonium/controllers/home_controller.dart';
import 'package:kryptonium/views/exchange/exchange.dart';
import 'package:kryptonium/views/home/home.dart';

class BottomNavBar extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  Widget callPage(int current) {
    switch (current) {
      case 0:
        return Home();
      case 1:
        return Exchange();
      case 2:
        return Home();
      default:
        return Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(() {
          return Center(
            child: callPage(homeController.selectedNavIndex.value),
          );
        }),
        bottomNavigationBar: Obx(() => Container(
              margin: const EdgeInsets.all(32.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BottomNavigationBar(
                    backgroundColor: const Color(0xFF535164),
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: Get.theme.primaryColor,
                    type: BottomNavigationBarType.fixed,
                    onTap: homeController.changeTabIndex,
                    currentIndex: homeController.selectedNavIndex.value,
                    items: [
                      BottomNavigationBarItem(
                        activeIcon: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: <Color>[
                                Get.theme.primaryColor.withOpacity(1),
                                Get.theme.colorScheme.secondary..withOpacity(1),
                              ],
                              tileMode: TileMode.repeated,
                            ).createShader(bounds);
                          },
                          child: const Icon(
                            Icons.home,
                            size: 32,
                          ),
                        ),
                        icon: const Icon(
                          Icons.home,
                          size: 32,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        activeIcon: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: <Color>[
                                Get.theme.primaryColor.withOpacity(0.8),
                                Get.theme.colorScheme.secondary
                                  ..withOpacity(0.8),
                              ],
                              tileMode: TileMode.repeated,
                            ).createShader(bounds);
                          },
                          child: const Icon(
                            Icons.swap_horiz,
                            size: 32,
                          ),
                        ),
                        icon: const Icon(
                          Icons.swap_horiz,
                          size: 32,
                        ),
                        label: 'Exchange',
                      ),
                      BottomNavigationBarItem(
                        activeIcon: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: <Color>[
                                Get.theme.primaryColor.withOpacity(0.8),
                                Get.theme.colorScheme.secondary
                                  ..withOpacity(0.8),
                              ],
                              tileMode: TileMode.repeated,
                            ).createShader(bounds);
                          },
                          child: const Icon(
                            Icons.person,
                            size: 32,
                          ),
                        ),
                        icon: const Icon(
                          Icons.person,
                          size: 32,
                        ),
                        label: 'Profile',
                      ),
                    ]),
              ),
            )));
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    // if (homeController.currentBackPressTime.value == null ||
    //     now.difference(homeController.currentBackPressTime.value) >
    //         Duration(seconds: 2)) {
    //   homeController.currentBackPressTime.value = now;
    //   displayBackWarning();
    //   return Future.value(false);
    // }
    return Future.value(true);
  }

  void displayBackWarning() {
    // ToastController(title: '', message: 'input.home.back.text'.tr).showToast();
  }
}
