import 'package:app_de_estudio/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BackgroundDecoration extends StatelessWidget {
  final Widget child;
  final bool showGradient;

  const BackgroundDecoration(
      {super.key, required this.child, this.showGradient = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Container(
          decoration: BoxDecoration(
            color: showGradient ? null : Theme.of(context).primaryColor,
            gradient: showGradient ? mainGradient() : null,
          ),
        )),
        Positioned.fill(child: SafeArea(child: child))
      ],
    );
  }
}
