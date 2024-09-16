import 'package:app_de_estudio/controllers/auth_controller.dart';
import 'package:app_de_estudio/controllers/questions_controller.dart';
import 'package:app_de_estudio/firebase_ref/references.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

extension QuestionControllerExtension on QuestionsController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestions {
    return '$correctQuestionCount de ${allQuestions.length} preguntas correctas';
  }

  String get points {
    var points = (correctQuestionCount / allQuestions.length) * 100;

    return points.toStringAsFixed(2);
  }

  Future<void> saveQuizResult() async {
    var batch = fireStore.batch();
    User? user = Get.find<AuthController>().getUser();
    if (user == null) {
      return;
    }
    batch.set(
        userRF
            .doc(user.email)
            .collection('recent_quizes')
            .doc(questionPaperModel.id),
        {
          "points": points,
          "correct_answer": '$correctQuestionCount/${allQuestions.length}',
          'question_id': questionPaperModel.id,
          'time': questionPaperModel.timeSeconds - remainSeconds
        });
    batch.commit();
    navigateToHome();
  }
}
