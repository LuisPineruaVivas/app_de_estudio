import 'package:app_de_estudio/configs/themes/custom_text_styles.dart';
import 'package:app_de_estudio/controllers/questions_controller.dart';
import 'package:app_de_estudio/screens/question/result_screen.dart';
import 'package:app_de_estudio/widgets/common/background_decoration.dart';
import 'package:app_de_estudio/widgets/common/custom_app_bar.dart';
import 'package:app_de_estudio/widgets/content_area.dart';
import 'package:app_de_estudio/widgets/questions/answer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckAnswerScreen extends GetView<QuestionsController> {
  const CheckAnswerScreen({super.key});
  static const String routeName = '/checkAnswer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(() => Text(
            'Pregunta ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}',
            style: appBarText)),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: BackgroundDecoration(
          child: Obx(() => Column(
                children: [
                  Expanded(
                      child: ContentArea(
                          child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(controller.currentQuestion.value!.question),
                        GetBuilder<QuestionsController>(
                            id: 'answer_review_list',
                            builder: (_) {
                              return ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers[index];
                                    final selectedAnswer = controller
                                        .currentQuestion.value!.selectedAnswer;
                                    final correctAnswer = controller
                                        .currentQuestion.value!.correctAnswer;
                                    final String answerText =
                                        '${answer.identifier}. ${answer.answer}';
                                    if (correctAnswer == selectedAnswer &&
                                        answer.identifier == selectedAnswer) {
                                      return CorrectAnswer(answer: answerText);
                                    } else if (selectedAnswer == null) {
                                      return NotAnswered(answer: answerText);
                                    } else if (correctAnswer !=
                                            selectedAnswer &&
                                        answer.identifier == selectedAnswer) {
                                      return WrongAnswer(answer: answerText);
                                    } else if (correctAnswer ==
                                        answer.identifier) {
                                      return CorrectAnswer(answer: answerText);
                                    }
                                    return AnswerCard(
                                        answer: answerText,
                                        onTap: () {},
                                        isSelected: false);
                                  },
                                  separatorBuilder: (_, index) {
                                    return const SizedBox(height: 10);
                                  },
                                  itemCount: controller
                                      .currentQuestion.value!.answers.length);
                            })
                      ],
                    ),
                  )))
                ],
              ))),
    );
  }
}
