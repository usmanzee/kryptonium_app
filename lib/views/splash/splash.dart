import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kryptonium/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/splash_icon.png", height: 60.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
