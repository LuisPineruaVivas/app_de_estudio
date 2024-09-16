import 'package:app_de_estudio/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderTextField extends StatelessWidget {
  String title;
  Widget child;
  HeaderTextField(
      {super.key, required this.title, this.child = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: onSurfaceTextColor),
        ),
        const SizedBox(width: 6),
        child
      ],
    );
  }
}
