import 'package:app_de_estudio/configs/themes/custom_text_styles.dart';
import 'package:app_de_estudio/configs/themes/ui_paramaters.dart';
import 'package:app_de_estudio/controllers/questions_controller.dart';
import 'package:app_de_estudio/widgets/common/background_decoration.dart';
import 'package:app_de_estudio/widgets/common/custom_app_bar.dart';
import 'package:app_de_estudio/widgets/common/main_button.dart';
import 'package:app_de_estudio/widgets/content_area.dart';
import 'package:app_de_estudio/widgets/questions/answer_card.dart';
import 'package:app_de_estudio/widgets/questions/countdown_timer.dart';
import 'package:app_de_estudio/widgets/questions/question_number_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizOverviewScreen extends GetView<QuestionsController> {
  const QuizOverviewScreen({super.key});

  static const String routeName = "/quizOverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedQuiz,
      ),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
              child: ContentArea(
                  child: Column(
            children: [
              Row(
                children: [
                  CountdownTimer(
                      color: UiParameters.isDarkMode()
                          ? Theme.of(context).textTheme.bodyLarge!.color
                          : Theme.of(context).primaryColor,
                      time: ''),
                  Obx(() => Text('${controller.time} Restante',
                      style: countDownTimerText()))
                ],
              ),
              const SizedBox(height: 20),
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
                      AnswerStatus? answerStatus;
                      if (controller.allQuestions[index].selectedAnswer !=
                          null) {
                        answerStatus = AnswerStatus.answered;
                      }
                      return QuestionNumberCard(
                          index: index + 1,
                          status: answerStatus,
                          onTap: () => controller.jumpToQuestion(index));
                    }),
              )
            ],
          ))),
          ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
                padding: UiParameters.mobileScreenPadding,
                child: MainButton(
                    title: 'Completado',
                    onTap: () {
                      controller.complete();
                    })),
          )
        ],
      )),
    );
  }
}
