import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Introduction extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const Introduction(
      {required this.title,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Get.theme.canvasColor,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
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
                    Get.theme.scaffoldBackgroundColor.withOpacity(0.9),
                    Get.theme.scaffoldBackgroundColor
                  ],
                )),
                child: null,
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Get.theme.textSelectionTheme.selectionColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Get.theme.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        )
      ],
    );
  }
}
