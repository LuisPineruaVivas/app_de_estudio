import 'package:app_de_estudio/configs/themes/custom_text_styles.dart';
import 'package:flutter/material.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({super.key, this.color, required this.time});
  final Color? color;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.timer, color: color ?? Theme.of(context).primaryColor),
        const SizedBox(width: 10),
        Text(
          time,
          style: countDownTimerText().copyWith(color: color),
        )
      ],
    );
  }
}
