import 'package:app_de_estudio/configs/themes/app_colors.dart';
import 'package:app_de_estudio/configs/themes/app_dark_theme.dart';
import 'package:app_de_estudio/configs/themes/app_icons.dart';
import 'package:app_de_estudio/configs/themes/custom_text_styles.dart';
import 'package:app_de_estudio/configs/themes/ui_paramaters.dart';
import 'package:app_de_estudio/controllers/question_paper/question_paper_controller.dart';
import 'package:app_de_estudio/controllers/zoom_drawer_controller.dart';
import 'package:app_de_estudio/screens/home/menu_screen.dart';
import 'package:app_de_estudio/screens/home/question_card.dart';
import 'package:app_de_estudio/widgets/content_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_) {
        return ZoomDrawer(
            borderRadius: 50.0,
            controller: _.zoomDrawerController,
            angle: 0.0,
            style: DrawerStyle.defaultStyle,
            slideWidth: MediaQuery.of(context).size.width * 0.7,
            menuBackgroundColor: primaryColorDark,
            menuScreen: const MenuScreen(),
            mainScreen: Container(
              decoration: BoxDecoration(gradient: mainGradient()),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: controller.toogleDrawer,
                            child: const Icon(
                              AppIcons.menuLeft,
                              size: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const Icon(AppIcons.peace),
                                Text(
                                  'Hola Luis',
                                  style: detailText.copyWith(
                                      color: onSurfaceTextColor),
                                )
                              ],
                            ),
                          ),
                          const Text(
                            "Que quieres practicar hoy",
                            style: headerText,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ContentArea(
                          addPadding: false,
                          child: Obx(
                            () => ListView.separated(
                              padding: UiParameters.mobileScreenPadding,
                              itemBuilder: (BuildContext context, int index) {
                                return QuestionCard(
                                  model:
                                      questionPaperController.allPapers[index],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int indx) {
                                return const SizedBox(height: 20);
                              },
                              itemCount:
                                  questionPaperController.allPapers.length,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      }),
    );
  }
}
