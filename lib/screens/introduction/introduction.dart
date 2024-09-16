import 'package:app_de_estudio/configs/themes/app_colors.dart';
import 'package:app_de_estudio/widgets/app_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: mainGradient()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, size: 65),
                const SizedBox(height: 40),
                const Text(
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: onSurfaceTextColor),
                  'Esta es una app de estudio te ayudara a aprender cualquier cosa que te propongas',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                AppCircleButton(
                    onTap: () => Get.offAndToNamed('/main_screen'),
                    child: const Icon(Icons.arrow_forward, size: 35)),
              ],
            ),
          )),
    );
  }
}
