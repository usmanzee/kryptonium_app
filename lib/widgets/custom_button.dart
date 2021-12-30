import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final Color color;
  final bool? isGradient;
  final List<Color>? gradientColors;

  const CustomButton(
      {required this.title,
      required this.color,
      this.isGradient = false,
      this.gradientColors,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: (isGradient != null && isGradient == true)
              ? LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                      Get.theme.primaryColor,
                      Get.theme.colorScheme.secondary
                    ])
              : LinearGradient(colors: [color, color])),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onClick,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            primary: (isGradient != null && isGradient == true)
                ? Colors.transparent
                : color,
            textStyle: Theme.of(context).textTheme.button,
            shadowColor: color.withOpacity(0.5),
            elevation: (isGradient != null && isGradient == true) ? 0 : 5,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
      ),
    );
  }
}
