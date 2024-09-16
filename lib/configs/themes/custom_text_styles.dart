import 'package:app_de_estudio/configs/themes/app_colors.dart';
import 'package:app_de_estudio/configs/themes/ui_paramaters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle cardTitle(context) => TextStyle(
    color: UiParameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyLarge!.color
        : Theme.of(context).primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold);

const questionText = TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
const detailText = TextStyle(fontSize: 12);
const headerText = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: onSurfaceTextColor);
const appBarText = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20, color: onSurfaceTextColor);
TextStyle countDownTimerText() => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    color: UiParameters.isDarkMode()
        ? Theme.of(Get.context!).textTheme.bodyLarge!.color
        : Theme.of(Get.context!).primaryColor);
