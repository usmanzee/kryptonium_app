import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kryptonium/widgets/custom_button.dart';

class AuthHome extends StatelessWidget {
  const AuthHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Get.theme.canvasColor,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/on_boarding.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: null,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Get.theme.scaffoldBackgroundColor.withOpacity(0.1),
                      Get.theme.scaffoldBackgroundColor
                    ],
                  )),
                  child: null,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    height: Get.size.height / 3.8,
                    width: Get.size.width / 1.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(43),
                        border: Border.all(color: Colors.black, width: 3.0)),
                    child: Container(
                      height: Get.size.height / 4,
                      width: Get.size.width / 2,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(43),
                          border: Border.all(color: Colors.black, width: 3.0)),
                      child: Image.asset(
                        "assets/images/splash_icon.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                Text(
                  'We’ve built an iron-clad crypto wallet for you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Get.theme.textSelectionTheme.selectionColor,
                      fontSize: 22,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  onClick: () {
                    Get.toNamed('/register');
                  },
                  title: 'Get Started',
                  color: Get.theme.canvasColor,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  title: 'I Already have an account',
                  color: Get.theme.primaryColor,
                  isGradient: true,
                  onClick: () {
                    Get.offNamed('/home');
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
