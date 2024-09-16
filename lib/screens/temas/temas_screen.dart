import 'package:app_de_estudio/configs/themes/app_colors.dart';
import 'package:app_de_estudio/configs/themes/app_dark_theme.dart';
import 'package:app_de_estudio/configs/themes/custom_text_styles.dart';
import 'package:app_de_estudio/configs/themes/ui_paramaters.dart';
import 'package:app_de_estudio/data/category_data.dart';
import 'package:app_de_estudio/widgets/topics/category_icon.dart';
import 'package:app_de_estudio/widgets/topics/header_text.dart';
import 'package:app_de_estudio/widgets/topics/tag.dart';
import 'package:app_de_estudio/widgets/content_area.dart';
import 'package:app_de_estudio/widgets/topics/topics_slider.dart';
import 'package:flutter/material.dart';

class TemasScreen extends StatelessWidget {
  const TemasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hola Luis",
                          style: headerText,
                        ),
                        Text(
                          "Que tema quieres aprender hoy",
                          style: detailText.copyWith(color: onSurfaceTextColor),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        margin: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2,
                                  blurStyle: BlurStyle.outer)
                            ]),
                        child: const Icon(Icons.notifications, size: 26),
                      ),
                      Positioned(
                          top: 0,
                          right: 8,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                          ))
                    ],
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ContentArea(
                      addPadding: false,
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: primaryDarkColorDark,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      TextField(
                                          style: const TextStyle(
                                              color: onSurfaceTextColor,
                                              fontWeight: FontWeight.bold),
                                          decoration: InputDecoration(
                                              filled: true,
                                              border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              fillColor: Colors.black,
                                              suffixIcon: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                margin: const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: primaryColorDark,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: const Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.all(15),
                                              hintText: 'Buscar Temas',
                                              hintStyle: const TextStyle(
                                                  color: primaryColorDark,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      const SizedBox(height: 10),
                                      HeaderTextField(
                                          title: 'Categorias',
                                          child: const Tag(title: 'Temas')),
                                      const SizedBox(height: 10),
                                      const CategorySlider(),
                                      HeaderTextField(
                                          title: 'Temas Nuevos',
                                          child: const Tag(title: 'Temas')),
                                      const TopicsSlider(),
                                      const SizedBox(height: 10),
                                      HeaderTextField(
                                          title: 'Temas',
                                          child: const Tag(title: 'Temas')),
                                      const TopicsSlider(),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategorySlider extends StatelessWidget {
  const CategorySlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categoryData.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryIcon(category: categoryData[index]);
          }),
    );
  }
}
