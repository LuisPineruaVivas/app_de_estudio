import 'package:app_de_estudio/configs/themes/app_colors.dart';
import 'package:app_de_estudio/configs/themes/custom_text_styles.dart';
import 'package:app_de_estudio/configs/themes/ui_paramaters.dart';
import 'package:app_de_estudio/controllers/question_controller_extension.dart';
import 'package:app_de_estudio/controllers/questions_controller.dart';
import 'package:app_de_estudio/screens/question/check_answer_screen.dart';
import 'package:app_de_estudio/widgets/common/background_decoration.dart';
import 'package:app_de_estudio/widgets/common/custom_app_bar.dart';
import 'package:app_de_estudio/widgets/common/main_button.dart';
import 'package:app_de_estudio/widgets/content_area.dart';
import 'package:app_de_estudio/widgets/questions/answer_card.dart';
import 'package:app_de_estudio/widgets/questions/question_number_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});
  static const String routeName = '/resultscreen';

  @override
  Widget build(BuildContext context) {
    Color textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: const SizedBox(height: 80),
        title: controller.correctAnsweredQuestions,
      ),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
              child: ContentArea(
                  child: Column(
            children: [
              SvgPicture.asset('assets/images/bulb.svg'),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: Text(
                  'Quiz Completado',
                  style: headerText.copyWith(color: textColor),
                ),
              ),
              Text('Tienes ${controller.points} puntos',
                  style: TextStyle(color: textColor)),
              const SizedBox(
                height: 25,
              ),
              const Text(
                  'Toca la preguntas para verificar las respuestas correctas',
                  textAlign: TextAlign.center),
              const SizedBox(height: 25),
              Expanded(
                  child: GridView.builder(
                      itemCount: controller.allQuestions.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Get.width ~/ 75,
                          childAspectRatio: 1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8),
                      itemBuilder: (_, index) {
                        final question = controller.allQuestions[index];
                        AnswerStatus status = AnswerStatus.notanswered;
                        final selectedAnswer = question.selectedAnswer;
                        final correctAnswer = question.correctAnswer;
                        if (selectedAnswer == correctAnswer) {
                          status = AnswerStatus.correct;
                        } else if (question.selectedAnswer == null) {
                          status = AnswerStatus.wrong;
                        } else {
                          status = AnswerStatus.wrong;
                        }
                        return QuestionNumberCard(
                            index: index + 1,
                            status: status,
                            onTap: () {
                              controller.jumpToQuestion(index, isGoBack: false);
                              Get.toNamed(CheckAnswerScreen.routeName);
                            });
                      }))
            ],
          ))),
          ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: UiParameters.mobileScreenPadding,
                child: Row(
                  children: [
                    Expanded(
                        child: MainButton(
                            title: 'Intentar otra vez',
                            color: Colors.blueGrey,
                            onTap: () {
                              controller.tryAgain();
                            })),
                    const SizedBox(width: 5),
                    Expanded(
                        child: MainButton(
                            title: 'Salir',
                            color: onSurfaceTextColor,
                            onTap: () {
                              controller.saveQuizResult();
                            }))
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
